From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Port SDIO GPIO to DTS
Date: Sat, 3 Feb 2018 17:09:54 +0300
Message-ID: <7e601dbb-0ee6-ea6f-1481-b1cf993ed96f@gmail.com>
References: <20180117221318.GA1594@localhost.localdomain>
 <91eab00b-9cfa-f150-369e-2426f9b9dc42@gmail.com>
 <20180130025229.GA1183@localhost.localdomain>
 <c899990a-822b-ebd0-4ccb-2d4d117de8f6@gmail.com>
 <20180202160635.GA1275@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180202160635.GA1275-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kyle Evans <kvans32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02.02.2018 19:06, Kyle Evans wrote:
> * Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> On 30.01.2018 05:52, Kyle Evans wrote:
>>> * Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>>> Hello Kyle,
>>>>
>>>> On 18.01.2018 01:13, Kyle Evans wrote:
>>>>> I have an ASUS TF101(ventana) that I am trying to get running on 
>>>>> mainline. It is mostly there, but there are a few issues that I believe 
>>>>> to be dts related. I am focusing on one at a time. Currently, when I 
>>>>> warm boot/reboot, the wireless SDIO device fails to initialize. It 
>>>>> works great on cold boot. I'm fairly certain the problem is in the 
>>>>> dts, but I'd like some feedback on the correct way.
>>>>>
>>>
>>>>> I'm not sure of the difference between WLAN_WOW & SDIO_WOW. I'm 
>>>>> assuming one for chip, one for radio, but I don't know their place in 
>>>>> the dts.
>>>>>
>>>>> From tegra20-ventana.dts I've got:
>>>>>
>>>>> 	sdhci@c8000000 {
>>>>>                 status = "okay";
>>>>>                 power-gpios = <&gpio TEGRA_GPIO(K, 6) GPIO_ACTIVE_HIGH>;
>>>>>                 bus-width = <4>;
>>>>>                 keep-power-in-suspend;
>>>>>         };
>>>>>
>>>>> I'm guessing I need to add the other pins to power-gpois and 
>>>>> set up mmc-pwrseq?
>>>>
>>>> The 'power-gpois' that you've defined looks fine and probably sufficient to get
>>>> WiFi up and running.
>>>>
>>>> Take a look at the changes that were needed to get WiFi working on Acer A500,
>>>> maybe some of it also applicable to TF101:
>>>
>>> Thanks for this. I have made some progress by adding regulator nodes 
>>> for pins D,1 & K,6, but am now getting the following error on second 
>>> boot.
>>>
>>> [    2.425281] mmc2: Invalid maximum block size, assuming 512 bytes
>>> [    2.480692] mmc2: SDHCI controller on c8000000.sdhci [c8000000.sdhci] using ADMA
>>> [    2.494647] mmc2: error -110 whilst initialising SDIO card
>>>
>>>>
>>>> https://github.com/digetx/picasso_upstream_support/commit/beab29d4f172836c5faad91d3232a7c77c5fc6fb
>>>   HACK: mmc: sdio: Add workaround for wrongly reported CCCR
>>>
>>> Would you recommend this over setting cap-sd-highspeed in the DT?
>>> Without either communication has been trouble free thus far. 
>>
>> Looks like cap-sd-highspeed should work, but I don't remember whether I've tried
>> it before or not, maybe there some obstacle with it. I'm recalling that WiFi
>> somewhat worked without the high speed CAP, but WiFi bandwidth sucked without
>> it, like it was 100 KB/s at max or something like that.
>>
>>>> https://github.com/digetx/picasso_upstream_support/commit/165e488e82c97fa1da6ccfe832a43569136000bc
>>>   mmc: Add "ignore mmc pm notify" functionality
>>>
>>> This does not apply cleanly, what are the symptoms?
>>
>> MMC code got refactored since then, you'll have to rebase the patch. Basically
>> s/of_property_read_bool/device_property_read_bool/. I'm now recalling that this
>> patch is only needed for the WiFi suspend/resume to work correctly.
> 
> Ok, good to know. I have not tried suspend yet.
> 
>>
>>>> https://github.com/digetx/picasso_upstream_support/commit/7e584ca4108707c6469a04bf92d9b659ce76c5cc
>>>   ARM: tegra: Add Picasso board file
>>>
>>> I am trying to implement this, but as-is boot hangs before u-boot clears.
>>
>> You may skip the board file, it's not really needed to make WiFi working. It's
>> likely that GPIO's are wired differently on your device, that code is A500 specific.
> 
> Good, I'm pretty sure that upstream would not accept a board file for 
> a wifi bug.
> 
>>
>>> static struct gpiod_lookup_table bluetooth_gpio_lookup = {
>>>        .dev_id = "rfkill_gpio.1",
>>>        .table = {
>>>                GPIO_LOOKUP("tegra-gpio", 160, "reset", 0),
>>>                { },
>>>        },
>>> }
>>>
>>> Where does 160 come from?
>>
>> From stock kernel. That's just a raw GPIO number.
> 
> I have determined it to be U,0, which is rfkill here as well.
> 
>>
>>> static int __init tegra_picasso_wifi_pwr_and_reset(void)
>>> {
>>>        if (!of_machine_is_compatible("acer,picasso"))
>>>                return 0;
>>>
>>>        writel(0x00004000, IO_TO_VIRT(0x6000D928));
>>>        writel(0x00004040, IO_TO_VIRT(0x6000D918));
>>>        writel(0x00004040, IO_TO_VIRT(0x6000D908));
>>>
>>>        writel(0x00000200, IO_TO_VIRT(0x6000D82C));
>>>        writel(0x00000202, IO_TO_VIRT(0x6000D81C));
>>>        writel(0x00000202, IO_TO_VIRT(0x6000D80C));
>>>
>>>        writel(0x00004040, IO_TO_VIRT(0x6000D928));
>>>        mdelay(100);
>>>
>>>        writel(0x00000202, IO_TO_VIRT(0x6000D82C));
>>>        mdelay(200);
>>>
>>>        return 0;
>>> }
>>>
>>> What is this magic, or where to find it in a stock kernel? 
>>
>> It should power-cycle BCM chip on boot, the code just writes GPIO controller
>> registers directly. I think there wasn't better place to do it in the code
>> without much effort, so I just hacked it that way. Sometimes brcmfmac driver
>> fails to probe the HW on boot and I think that power-cycle helps a tad. Although
>> I suppose that it's upstream driver fault, it looks like it doesn't perform HW
>> initialization properly because I haven't had any issues like that with the
>> downstream BCMHD driver ported to upstream kernel, literally using same DT /
>> board code.
>>
>> In stock kernel it should be ventana_wifi_power() that does the same.
> 
> I see that the ventana_wifi_power() calls clk_enable(wifi_32k_clk). So,
> the problem could be clock related. However, I do not see any dts trees
> that use `compatible = "brcm,bcm4329-fmac"` also call out any special
> clocks. 

This clock is always "on" with the upstream kernel, it shouldn't cause any problems.

> I am inclined to second it as a driver issue becuase I have done
> everything suggested with no success. I started out by posting to 
> linux-wireless and came here when I discovered that modprobe -r 
> sdhci-tegra; modprobe shci-tegra; brought the interface up after 
> failure. Unfortunately, I do not use a ramdisk so such a workaround is 
> not possible because then I would get a VFS panic.

Just the WiFi driver module reload also usually helps.

> Although it would be nice to have a system fully functional after 
> reboot with all of the code porting and testing that is required, I 
> think I shall put this issue on the back burner. I am excited for all 
> of the work you are doing with the grate driver.

Well, in my case the unrecoverable failure happens quite rare, I'd say it is
mostly working fine. Indeed somebody would have to invest some time and effort
to figure out why it happens at all.

Yeah, grate hacking is a lot of fun. You should try it too :)
