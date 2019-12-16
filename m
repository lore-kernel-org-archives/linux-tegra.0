From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 03/15] soc: tegra: Add Tegra PMC clock registrations
 into PMC driver
Date: Mon, 16 Dec 2019 18:49:21 +0300
Message-ID: <fa538845-cb8e-cf88-34be-3ceb2daa63c2@gmail.com>
References: <ccb715cc-c927-ea91-a26e-24d6eeeeef1a@gmail.com>
 <ee1d39d4-9a57-da9b-fce6-8130dac1d2fd@nvidia.com>
 <49da77dc-b346-68eb-9ef8-42cfb3221489@nvidia.com>
 <3f1c9325-3017-62be-1e3b-82fd28540fdf@nvidia.com>
 <6fcbff3d-8695-7cd0-60de-6eb523b6964c@gmail.com>
 <20191211151028.GZ28289@pdeschrijver-desktop.Nvidia.com>
 <0930a710-174b-859b-294c-e9f81f6a3b5e@gmail.com>
 <20191216122005.GB28289@pdeschrijver-desktop.Nvidia.com>
 <53653719-f8e5-f6d1-a1d1-e53c7ccd7636@gmail.com>
 <20191216151132.GC28289@pdeschrijver-desktop.Nvidia.com>
 <20191216152435.GD28289@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191216152435.GD28289@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, sboyd@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

16.12.2019 18:24, Peter De Schrijver пишет:
> On Mon, Dec 16, 2019 at 05:11:32PM +0200, Peter De Schrijver wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On Mon, Dec 16, 2019 at 05:23:23PM +0300, Dmitry Osipenko wrote:
>>>>> Could you please clarify what do you mean by the "existing users"?
>>>>> AFAIK, nothing in kernel uses mux clocks.
>>>>
>>>> The DT clk bindings allow for parent initialization, so it's certainly
>>>> possible there are some DTs which rely on this. We promised to never
>>>> break the bindings, which changing to 1 clock would do.
>>>
>>> What about this variant:
>>>
>>>   1. Keep the old CaR code in place.
>>>
>>>   2. Make CaR driver to scan whole device-tree for the legacy PMC clocks.
>>>
>>>   3. If legacy clock is found, then register PMC clocks from CaR.
>>>
>>>   4. If legacy clocks are not found, then don't register PMC clocks from
>>> CaR.
>>>
>>>   5. Add clocks support to the PMC driver and only register them if
>>> legacy clocks are not registered by CaR.
>>>
>>> Now both old and new DTBs can co-exist and work, everyone happy.
>>
>> That seems even more work.. Today the only upstream user is audio.
>> Currently these clocks are setup by the CAR clock driver. However
>> as they will move to the PMC driver, this mechanism cannot be used.
>> Hence the plan is to modify the audio driver to check for the PMC clocks
>> in DT and if they are not available use the CAR clocks as fallback.
>> The whole reason the clocks move to the PMC driver, is that when PMC
>> becomes secure, all accesses have to go via an SMC. Given that we don't
>> want SMCs all over the Tegra drivers, it's a good opportunity to move
>> the PMC clock handling into the PMC driver. PMC can be secure with both
>> 'new' and old DTs, so just registering the PMC clocks in the CAR driver
>> if legacy clocks are found in the DT, won't always work.
>>
> 
> Given the audio driver needs to change anyway, we can indeed use 1 clock
> per PMC clk_out_ rather than 2 as we have today. As this models the hw
> slightly better, I think we should do that as you suggested.
> 
> Peter.
> 

Okay, let's try and see how it will go.
