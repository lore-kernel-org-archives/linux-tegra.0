From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] tegra: ventana: display and backlight DT entries
Date: Tue, 13 Nov 2012 09:46:52 -0700
Message-ID: <50A2797C.9030807@wwwdotorg.org>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com> <20121113123410.GA11202@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121113123410.GA11202-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/13/2012 05:34 AM, Thierry Reding wrote:
> On Tue, Nov 13, 2012 at 07:23:24PM +0900, Alexandre Courbot wrote:
>> Enable internal panel: - add EDID file - add power sequence to
>> control backlight and panel (panel is currently controlled by the
>> backlight sequence, this will need to be fixed once the panel
>> framework has power sequences support)
>> 
>> Also enable HDMI output.

>> diff --git a/arch/arm/boot/dts/tegra20-ventana.dts
>> b/arch/arm/boot/dts/tegra20-ventana.dts

>> +			rgb { +				status = "okay"; +				nvidia,edid =
>> /incbin/("tegra20-ventana.edid");
> 
> We've briefly discussed this on IRC already, but for the sake of 
> completeness I'll restate it here. I think this should be converted
> to the bindings as defined by the videomode helpers. These are not
> merged yet, but they provide a much more readable representation
> than a binary blob.
> 
> I know that Stephen mentioned using the nvidia,edid property for
> boards where the blob is actually available in some sort. I seem to
> remember him mentioning Ventana in particular, but I may be wrong.

I do tend to think that we should use EDID where there is one.

1) If there is an EDID in the panel HW, and the panel's I2C is hooked
up to Tegra, we should read it out at runtime.

2) Otherwise, if the panel's documentation provides an EDID, we should
use that, since it's the most canonical/common/standard representation
of the panel's properties.

3) Otherwise, use the videomode DT bindings.

Another benefit of (2) is that we can actually support the panel
without waiting for the videomode DT bindings to be finalized and merged.

Although if Ventana requires the power sequences helpers, that already
means we won't be able to support Ventana's panel in 3.8 unless the
power sequences code gets merged for 3.8; is that likely?
