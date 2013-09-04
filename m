From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 3/6] host1x: hdmi: Enable Vdd earlier for hotplug/DDC
Date: Thu, 05 Sep 2013 01:03:59 +0300
Message-ID: <5227AE4F.8050603@kapsi.fi>
References: <1377704922-2824-1-git-send-email-mperttunen@nvidia.com> <1377704922-2824-4-git-send-email-mperttunen@nvidia.com> <52277F90.40109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52277F90.40109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/04/2013 09:44 PM, Stephen Warren wrote:
> On 08/28/2013 09:48 AM, Mikko Perttunen wrote:
>> The Vdd regulator used to be enabled only at tegra_output_hdmi_enable,
>> which is called after a sink is detected. However, the HDMI hotplug pin
>> works by returning the voltage supplied by the Vdd pin, so this meant
>> that the hotplug pin was never asserted and the sink was not detected
>> unless the Vdd regulator was set to be always on.
>>
>> This patch moves the enable to the tegra_hdmi_drm_init function to make
>> sure the regulator will get enabled.
>
> The DT binding document isn't very clear on this topic (and should be
> fixed): What is this regulator intended to control? If this regulator
> solely controls the supply to the hotplug detection circuit, this change
> makes sense. If the regulator mainly supplies something else (e.g. part
> of the HDMI core on the Tegra chip), then perhaps this change isn't
> correct. The correct approach might be to introduce another (optional)
> regulator specifically for the hotplug circuit. Presumably both DT
> properties vdd-supply and hotplug-supply could point at the same
> regulator if that's the way the HW was wired up.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

AFAICT, it controls the Vdd pin on the HDMI port, so it just affects the 
hotplug pin and the DDC I2C bus power.
