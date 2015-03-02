From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v6 06/15] of: Add Tegra124 EMC bindings
Date: Mon, 02 Mar 2015 11:51:31 +0200
Message-ID: <54F432A3.9090500@kapsi.fi>
References: <1423750042-6535-1-git-send-email-tomeu.vizoso@collabora.com> <1423750042-6535-7-git-send-email-tomeu.vizoso@collabora.com> <CAAVeFuL71-VZxAxzGKdn0SebhYrCkFixOiLwq6Ebbih8B+NiRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuL71-VZxAxzGKdn0SebhYrCkFixOiLwq6Ebbih8B+NiRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/02/2015 10:47 AM, Alexandre Courbot wrote:
> On Thu, Feb 12, 2015 at 11:06 PM, Tomeu Vizoso
> <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add binding documentation for the nvidia,tegra124-emc device tree node.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>>
>> ---
>>
>> v5:     * Add a short description for each of the register properties
>>
>> v4:     * Remove mandatory naming of the timings subnode
>>          * Remove constraint on the unit-address of the timings and timing subnodes
>>          * Add some more information about nvidia,emc-configuration
>>          * Make the example complete
>>
>> v2:     * Specify the unit addresses for the timings and timing nodes
>> ---
>>   .../bindings/memory-controllers/tegra-emc.txt      | 379 +++++++++++++++++++++
>>   1 file changed, 379 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
>> new file mode 100644
>> index 0000000..da923b1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
>> @@ -0,0 +1,379 @@
>> +NVIDIA Tegra124 SoC EMC (external memory controller)
>> +====================================================
>> +
>> +Required properties :
>> +- compatible : Should be "nvidia,tegra124-emc".
>> +- reg : physical base address and length of the controller's registers.
>> +- nvidia,memory-controller : phandle of the MC driver.
>> +
>> +The node should contain a "emc-timings" subnode for each supported RAM type (see field RAM_CODE in
>> +register PMC_STRAPPING_OPT_A), with its unit address being its RAM_CODE.
>> +
>> +Required properties for "emc-timings" nodes :
>> +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is used for.
>> +
>> +Each "emc-timings" node should contain a "timing" subnode for every supported EMC clock rate. The
>> +"timing" subnodes should have the clock rate in Hz as their unit address.
>> +
>> +Required properties for "timing" nodes :
>> +- clock-frequency : Should contain the memory clock rate in Hz.
>> +- The following properties contain EMC timing characterization values (specified in the board
>> +documentation) :
>> +  - nvidia,emc-auto-cal-config : EMC_AUTO_CAL_CONFIG
>> +  - nvidia,emc-auto-cal-config2 : EMC_AUTO_CAL_CONFIG2
>> +  - nvidia,emc-auto-cal-config3 : EMC_AUTO_CAL_CONFIG3
>> +  - nvidia,emc-auto-cal-interval : EMC_AUTO_CAL_INTERVAL
>> +  - nvidia,emc-bgbias-ctl0 : EMC_BGBIAS_CTL0
>> +  - nvidia,emc-cfg : EMC_CFG
>> +  - nvidia,emc-cfg-2 : EMC_CFG_2
>> +  - nvidia,emc-cfg-dig-dll : EMC_CFG_DIG_DLL
>> +  - nvidia,emc-ctt-term-ctrl : EMC_CTT_TERM_CTRL
>> +  - nvidia,emc-mode-1 : Mode Register 1
>> +  - nvidia,emc-mode-2 : Mode Register 2
>> +  - nvidia,emc-mode-4 : Mode Register 4
>> +  - nvidia,emc-mode-reset : Mode Register 0
>> +  - nvidia,emc-mrs-wait-cnt : EMC_MRS_WAIT_CNT
>> +  - nvidia,emc-sel-dpd-ctrl : EMC_SEL_DPD_CTRL
>> +  - nvidia,emc-xm2dqspadctrl2 : EMC_XM2DQSPADCTRL2
>> +  - nvidia,emc-zcal-cnt-long : EMC_ZCAL_WAIT_CNT
>> +  - nvidia,emc-zcal-interval : EMC_ZCAL_INTERVAL
>> +- nvidia,emc-configuration : EMC timing characterization data. These are the registers (see section
>> +"15.6.2 EMC Registers" in the TRM) whose values need to be specified, according to the board
>> +documentation:
>
> I'm a little bit confused by this. On the one hand, some registers are
> defined by dedicated DT properties, and on the other some are simply
> specified in the nvidia,emc-configuration array. I guess the rationale
> for this is to isolate the registers whose value may control the
> driver vs. those that simply needs to be written as-is.
>
> But in this case, why are some registers (like EMC_CFG_DIG_DLL)
> present in both lists, sometimes with different values? In the case of
> EMC_CFG_DIG_DLL, I also see that the read value of
> "nvidia,emc-cfg-dig-dll" seems to never be used anywhere in
> tegra124-emc.c. Should this property exist at all? Note that I have
> only checked this one, there might be others in the same case.
>
> Or maybe I completely misunderstood the intent here, in which case,
> please enlighten me. :)
>

Well spotted! Looks like the nvidia,emc-cfg-dig-dll property should not 
be there. The list was essentially copied from the downstream kernel; 
looks like there the list of variables was probably based on that of 
Tegra148, where the cfg-dig-dll seems to be used. (The downstream 
Tegra124 does not use it.) Should check this for the other properties as 
well.

Mikko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
