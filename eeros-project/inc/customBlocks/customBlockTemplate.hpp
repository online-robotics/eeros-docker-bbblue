#ifndef CUSTOMBLOCKTEMPLATE_HPP_
#define CUSTOMBLOCKTEMPLATE_HPP_

#include <eeros/control/Blockio.hpp>
// Include header files for the subblocks

using namespace eeros::control;

template <typename T = double>
class CustomBlockName : public Blockio<1,1,T>   // Set the number of inputs and outputs
{
public:
    CustomBlockName() 
    {
        // Connect subblocks, initialize variables, ...
    }

    // Implement getter functions for the subsystem inputs

    virtual void run()
    {
        // Calculate output values, set timestamps and 
        // call the run method of the subblocks
    }

protected:
    // Define intermediate variables and subblocks
};

#endif //CUSTOMBLOCKTEMPLATE_HPP_
