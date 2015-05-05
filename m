From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Tue, 05 May 2015 14:07:11 -0600
Message-ID: <554922EF.3050906@wwwdotorg.org>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru> <20150403194635.GC2016@katana> <1549160.njMIY2NVTi@fb07-iapwap2> <20150505105513.GA1841@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150505105513.GA1841@katana>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/05/2015 04:55 AM, Wolfram Sang wrote:
>
> I'm back in town. Sorry for the delay...
>
>> One thing where we need your help as a I2C maintainer is how to represent an
>> i2c slave device using device-tree. You may remember our discussion in the
>> past from here [1] where you suggested to just make a slave client by its
>> compatible name. Stephen Warren from NVIDIA raised some concerns about this
>> solution because it may not be appropriate in all possible future cases (which
>> is what a proper device-tree representation should take care off). He instead
>> suggested to mark a slave client by adding some flag to the reg property, to
>> be able to handle a situation where both master client and slave client have
>> the same i2c bus address forming a loopback (e.g. for testing purpose) on the
>> same bus. More details here [2].
>
> Well... I can agree that we shouldn't prevent a loopback from a DT point
> of view. (Despite the fact that it is really for development and I
> wonder how many I2C IP cores can do this flawlessly)
>
> However, I am still against putting that information into the reg
> property. I see devices coming which have multiple addresses, so people
> somewhen want to encode this in DT as well. I'd like to have that a
> simple array of addresses. Adding flags, rarely used, will create a mess
> IMO.

The container node has a #address-cells property for this very reason. 
It's perfectly well-defined how to split up a property containing a 
large number of cells into separate values, by using the value of 
#address-cells. Plus, the canonical formatting (albeit not enforced by 
the DT compiler) for a property that contains an array of entries, each 
2 cells in size, would be:

reg = <0 0x1a>, <0 0x40>, <0 0x48>;

rather than:

reg = <0 0x1a 0 0x40 0 0x48>;

... so it's quite simple to make it very human-readable too.

> So what about adding a new property "i2c-slave-reg"? This does not only
> prevent the confusion above, but also makes it very clear that this node
> is an I2C slave without the need to encode that somehow in the
> compatible property (although it probably should be described there as
> well, still).

That doesn't sound like a good idea. reg is the DT-defined way of 
identifying/numbering child nodes. We shouldn't invent other properties 
that mean essentially the same thing, but simply encode flags.

It might be reasonable to split an I2C controller node up so that it has 
n child nodes:

i2c-controller@1234 {
     compatible = "foo";
     reg = <0x1234 0x100>;
     #address-cells = <1>;
     #size-cells = <0>;
     master {
         eeprom@1a {
              compatible = ...;
              reg = <0x1a>;
         };
         ...
     };
     slave {
         nvec@NN {
              compatible = ...;
              reg = <0xNN>;
         };
         ...
     };
};

However, that seems a lot more complex and invasive than just adding an 
extra address cell to reg, and putting everything into a single node.

>> I hope with this post I can join the different discussions somehow so we are
>> able to find a common sense which is acceptable for all.
>
> Thanks for doing this! I changed the subject to maybe raise interest a
> bit more.
