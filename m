From: "Turquette, Mike" <mturquette-l0cyMroinI0@public.gmane.org>
Subject: Re: moving Tegra30 to the common clock framework
Date: Tue, 8 May 2012 10:15:19 -0700
Message-ID: <CAJOA=zP4iEZ+CFfCjT1rgU6shOt_PUf2BRB76NEQCoUPZJ9hVg@mail.gmail.com>
References: <20120503161311.GG20304@tbergstrom-lnx.Nvidia.com>
 <20120507000329.GB14559@gmail.com> <4FA7ECAA.1040104@wwwdotorg.org>
 <CAJOA=zNKDFPOQ9-0EuEy=dtq=g-CKFBq94enTuoB7wVPskbkMg@mail.gmail.com> <CAAXpJNsJiT7s87p6jS5bdi-83n4bwSaagdSK0w3SbrVz+k+O0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAXpJNsJiT7s87p6jS5bdi-83n4bwSaagdSK0w3SbrVz+k+O0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhoujie wu <zhoujiewu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Saravana Kannan <skannan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 7, 2012 at 10:07 PM, zhoujie wu <zhoujiewu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hi Mike,
> Could you please explain more details about how to implement a
> re-parenting operation as part of it's .set_rate implementation?

Sure.

> As far as I know, we can not call clk_set_parent in .set_rate functio=
n
> directly, since clk_set_rate and clk_set_parent are using the same
> prepare_lock.

That is correct.

> Any other interface can be used to implement it?

You have two options available to you.

1) __clk_reparent can be used from your .set_rate callback today to
reflect changes made to the tree topology.  OMAP uses this in our PLL
=2Eset_rate implementation: depending on the re-lock frequency the PLL
may switch parents dynamically.  __clk_reparent does the
framework-level cleanup needed for this (that function is also used
when populating the clock tree with new clock nodes).

2) __clk_set_parent could be made non-static if you needed this (I've
been meaning to talk to Saravana about this since I think MSM needs
something like this).  This is not done today but perhaps you can
experiment with it and let me know what you find?

If you stare at the code for a while I'm sure you'll see how it comes
together.  If any infrastructure that you require is missing please
let me know.

Regards,
Mike

> Thanks.
>
> 2012/5/8 Turquette, Mike <mturquette-l0cyMroinI0@public.gmane.org>:
>> On Mon, May 7, 2012 at 8:39 AM, Stephen Warren <swarren-3lzwWm7+WeqIh2JisoIxyg@public.gmane.org=
g> wrote:
>>> On 05/06/2012 06:03 PM, Mike Turquette wrote:
>>>> On 20120503-19:13, Peter De Schrijver wrote:
>>>>> Hi,
>>>>>
>>>>> I started looking into what would be needed to move our tegra30 c=
lock code
>>>>> to the common clock framework. The tegra30 clocktree is rather fl=
at. Basically
>>>>> there are a bunch of sources (13 PLLs, external audio clocks, osc=
 and 32Khz)
>>>>> and peripheral clocks which have a mux (with 4 or more inputs), a=
 divider and
>>>>> a gate. So almost every peripheral clock can have multiple parent=
s.
>>>>>
>>>>> Some questions:
>>>>>
>>>>> 1) should these peripheral clocks be modelled as 3 different cloc=
ks
>>>>> =A0 =A0(mux -> divider -> gate) or would it be better to make a n=
ew clock type for
>>>>> =A0 =A0this?
>>>>>
>>>>
>>>> That is really for you to decide. =A0If the semantics of the exist=
ing mux,
>>>> divider and gate in drivers/clk/clk-*.c work well for you then I t=
hink
>>>> the answer is "yes". =A0There is infrastructure for register-acces=
s
>>>> locking in those common types which might help your complex clocks=
=2E
>>>>
>>>> Thanks to the parent rate propagation stuff in clk_set_rate it sho=
uld be
>>>> possible for your drivers to only be aware of the gate and call
>>>> clk_set_rate on only that clock, which propagates up to the divide=
r and,
>>>> if necessary, again propagates up to the mux.
>>>>
>>>> I encourage you to try that first. =A0But if you find the semantic=
s of
>>>> those basic clock types aren't cutting it for you then you must cr=
eate a
>>>> type which is platform-specific.
>>>
>>> A lot of these mux/divider/gate clocks go out to peripherals, whose
>>> drivers want to call both clk_set_rate() and clk_en/disable() on th=
e clock.
>>>
>>> There's only 1 clock reaching the peripheral in HW, so the driver s=
hould
>>> only call clk_get() once, and similarly the DT should only provide =
a
>>> single clock to the driver.
>>>
>>
>> Sounds good so far.
>>
>>> Given the mux->divider->gate clock construction, that clock would
>>> presumably be the gate object. clk_en/disable() clearly work there,=
 but
>>> is clk_set_rate() intended to propagate up the chain until it can b=
e
>>> satisfied, i.e. does the gate clock object's set_rate() op simply c=
all
>>> the parent's set_rate() op?
>>>
>>
>> Only if you set the CLK_SET_RATE_PARENT flag on the children. =A0Tak=
e
>> the following example sub-tree:
>>
>> mux
>> =A0|
>> div
>> =A0|
>> gate
>>
>> If gate does NOT have CLK_SET_RATE_PARENT set in struct clk->flags
>> then clk_set_rate will do nothing (since it does not implement a
>> .set_rate callback). =A0If the flag is set then the framework will k=
ick
>> the rate request up to the parent, 'div'. =A0Div implements a .set_r=
ate
>> callback and may or may not set the CLK_SET_RATE_PARENT flag. =A0Hav=
ing
>> a .set_rate implemenation does preclude one from propagating the rat=
e
>> change up the tree, so it is possible to adjust the divider to a new
>> rate AND still kick the rate change request up to the parent, 'mux'.
>> In your case 'mux' should probably not set CLK_SET_RATE_PARENT and t=
he
>> propagation will end there. =A0'mux' might implement a re-parenting
>> operation as part of it's .set_rate implementation.
>>
>> This is covered fairly well in Documentation/clk.txt
>>
>>> If the order were instead mux->gate->divider, would it be correct f=
or
>>> enable/disable to propagate from the divider to the gate?
>>>
>>
>> Correct. =A0Order doesn't matter. =A0Even in the absence of a
>> .prepare/.enable callback the framework will still propagate these
>> changes as part of typical use-counting rules.
>>
>>>>> 2) how to define the default parent? in many cases the hw reset v=
alue isn't
>>>>> =A0 =A0a very sensible choice, so the kernel probably needs to se=
t a parent of
>>>>> =A0 =A0many of them if we don't want to rely on bootloader config=
uration.
>>>>
>>>> The only related thing handled at the framework level is _discover=
y_ of
>>>> the parent during clock registration/initialization. =A0If you don=
't trust
>>>> the bootloader and want to set things up as soon as possible (a wi=
se
>>>> move) then I suggest you do so from your platform clock code at th=
e same
>>>> time that you register your clocks with the framework. =A0Somethin=
g like:
>>>>
>>>> =A0 =A0 =A0 struct clk *c;
>>>> =A0 =A0 =A0 c =3D clk_register(...);
>>>> =A0 =A0 =A0 if (IS_ERR(c))
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 omg_fail();
>>>> =A0 =A0 =A0 clk_set_parent(c, b);
>>>>
>>>> Where 'b' is a parent of 'c'. =A0Register your clock tree top-down=
 and you
>>>> can re-parent as you go.
>>>
>>> I'm hoping we can represent this in device tree somehow, so that
>>> individual boards can set the clock tree up differently depending o=
n
>>> their needs (e.g. Tegra20 doesn't have quite enough PLLs, so someti=
mes a
>>> particular PLL will be used to generate the 2nd display's pixel clo=
ck,
>>> whereas on other boards it may be used for some peripherals). So, w=
e'd
>>> like to describe this in DT.
>>>
>>> It seems like it'd be pretty common to want the kernel to fully
>>> initialize the clock tree, and to do this from device tree, so perh=
aps
>>> this might evolve into a common (part of) a cross-SoC clock binding=
, or
>>> some kind of utility function that parsed a clock-tree-init-table f=
rom DT?
>>
>> As long as the configuration of your clocks can be expressed by the
>> existing clk api, e.g. clk_prepare / clk_enable / clk_set_rate /
>> clk_set_parent, then I think it would be easy to define a format
>> whereby the clock is configured immediately after being registered.
>> Essentially it would do what I outline in my original email above, b=
ut
>> the configuration could be encoded into DT.
>>
>> Any platform-specific clock configuration (bits that aren't obviousl=
y
>> expressed by the clk.h api) will be harder to configure through
>> generic DT bindings.
>>
>> Regards,
>> Mike
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
>
> --
> Zhoujie Wu
