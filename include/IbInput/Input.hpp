#include <functional>
#include <optional>
#include <vector>
#include <string_view>

namespace hinput {
    struct KeyboardInput {
        enum KeyboardInputType {
            KeyboardReleased,
            KeyPressed,
            KeyReleased
        } type;

        uint16_t key;
    };

    struct Input {
        enum InputType {
            Keyboard
        } type;
        union {
            KeyboardInput kbd;
        };
    };

    struct Action {
        std::vector<Input> act;

        static Action parse(std::string_view str);
    };

    class InputProcessor {
    public:
        using Subscriber = std::function<void(const Action& action)>;

        void subscribe_action(const Action& action, const Subscriber& subscriber);

        void process(const Input& input);

    protected:
        struct ActionSubscriber {
            Action action;
            Subscriber subscriber;
        };

        std::vector<ActionSubscriber> actions;
    };

    class InputCollector {
    public:
        virtual ~InputCollector() = 0;

        void add_processor(InputProcessor& processor);
    };
}

