From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] tegra: ventana: display and backlight DT entries
Date: Wed, 14 Nov 2012 13:56:45 +0800
Message-ID: <50A3329D.8000708@nvidia.com>
References: <1352802204-1740-1-git-send-email-acourbot@nvidia.com> <20121113123410.GA11202@avionic-0098.mockup.avionic-design.de> <50A2797C.9030807@wwwdotorg.org> <1393946.fMW2YXfOao@percival>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393946.fMW2YXfOao@percival>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/14/2012 01:36 PM, Alex Courbot wrote:
> On Wednesday 14 November 2012 00:46:52 Stephen Warren wrote:
>> I do tend to think that we should use EDID where there is one.
>>
>> 1) If there is an EDID in the panel HW, and the panel's I2C is hooked
>> up to Tegra, we should read it out at runtime.
> 
> According to Ventana' platform design guide the LCD panel is hooked on I2C2. 
> The panel's data sheet lists CLK_EDID and DATA_EDID pins, which I assume are 
> for I2C, but there is no mention of an I2C address in both guides.
> 

Normally the address is 0x50. Take a look at function
"drm_do_probe_ddc_edid" as a reference.

>> 2) Otherwise, if the panel's documentation provides an EDID, we should
>> use that, since it's the most canonical/common/standard representation
>> of the panel's properties.
> 
> Panel's documentation indeed provides full EDID specification in appendix. Mark 
> sent me an EDID blob which works but I don't know where it comes from - Mark, 
> could you tell us?
> 

Actually I use a tool named "i2cget" to get this 128 bytes EDID. For
Ventana, I use a script like this:

for i in  $(seq 0 127)
do
	#echo " Reading byte no : $i "
	i2cget -y 0 0x50 $i | xxd -r -p >> tegra20-ventana.edid
done

>> 3) Otherwise, use the videomode DT bindings.
>>
>> Another benefit of (2) is that we can actually support the panel
>> without waiting for the videomode DT bindings to be finalized and merged.
> 
> Is there another incentive for preferring (2) over (3)? EDID specs can easily 
> be turned into videomode bindings, and it would also avoid introducing a new 
> file into the kernel source.
> 
>> Although if Ventana requires the power sequences helpers, that already
>> means we won't be able to support Ventana's panel in 3.8 unless the
>> power sequences code gets merged for 3.8; is that likely?
> 
> Likely, I don't know, possible - maybe. Power seqs work and I could push to 
> get them merged, but the following points need to be considered:
> - DT bindings are likely to change from their current form. I want to take 
> advantage of the gpio API changes that are undergoing, and also probably of 
> your preprocessor patch for dtc (not sure if that is already usable in the 
> kernel?). Considering the feature is young I don't think a DT change would be 
> a big deal, but the general consensus seems to be that DT bindings are 
> immutable - maybe my perception is wrong?
> - If I am to take maintainership of the feature, I guess I will have to get 
> the patches sufficiently Ack'ed by enough people, and also have someone else 
> pull from my tree (Linus? Or maybe some other power maintainer?). I am not 
> familiar with the exact procedure here - moreover, my GPG key only has one 
> signature from a trusted kernel dev, I am not sure if this is enough.
> 
> Alex.
> 
