From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] host1x: hdmi: Detect whether display is connected
 with HDMI or DVI
Date: Wed, 28 Aug 2013 15:34:53 +0300
Message-ID: <521DEE6D.4050503@nvidia.com>
References: <1377686459-16634-1-git-send-email-mperttunen@nvidia.com> <1377686459-16634-3-git-send-email-mperttunen@nvidia.com> <20130828120727.GA32254@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130828120727.GA32254@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/28/2013 03:07 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Wed, Aug 28, 2013 at 01:40:56PM +0300, Mikko Perttunen wrote:
>> Use EDID data to determine whether the display supports HDMI or just=
 DVI.
>> This used to be hardcoded to be HDMI, which broke support for DVI di=
splays
>> that couldn't understand the interspersed audio/other data.
>>
>> If the EDID data isn't available, default to DVI, which should be a =
safer
>> choice.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/host1x/drm/hdmi.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/=
hdmi.c
>> index d81fac8..140339b 100644
>> --- a/drivers/gpu/host1x/drm/hdmi.c
>> +++ b/drivers/gpu/host1x/drm/hdmi.c
>> @@ -702,6 +702,14 @@ static int tegra_output_hdmi_enable(struct tegr=
a_output *output)
>>   	unsigned long value;
>>   	int retries =3D 1000;
>>   	int err;
>> +	struct drm_property_blob *edid_blob =3D output->connector.edid_blo=
b_ptr;
>> +
>> +	if (edid_blob && edid_blob->data &&
>> +		drm_detect_hdmi_monitor((struct edid *)edid_blob->data)) {
>> +		hdmi->dvi =3D false;
>> +	} else {
>> +		hdmi->dvi =3D true;
>> +	}
>>
>>   	pclk =3D mode->clock * 1000;
>>   	h_sync_width =3D mode->hsync_end - mode->hsync_start;
>
> Odd, now that I see that code I remember that there was a similar pat=
ch
> a few months back, but it was never applied for some reason:
>
> 	http://lists.freedesktop.org/archives/dri-devel/2013-January/033509.=
html
>
> That was already reviewed by me and Jon Mayo, so I'll go ahead and ap=
ply
> that one instead.
>
> Thierry
>
> * Unknown Key
> * 0x7F3EB3A1
>

That patch seems to cause a warning for me:
drivers/gpu/host1x/drm/hdmi.c: In function =91tegra_output_hdmi_enable=92=
:
drivers/gpu/host1x/drm/hdmi.c:706:2: warning: passing argument 1 of=20
=91drm_detect_hdmi_monitor=92 discards =91const=92 qualifier from point=
er target=20
type [enabled by default]
include/drm/drm_crtc.h:1037:13: note: expected =91struct edid *=92 but=20
argument is of type =91const struct edid *=92

Looks much nicer though.
