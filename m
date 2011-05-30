From: Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 2/2] ARM:Tegra: Device Tree Support: Initialize audio card
 gpio's from the device tree.
Date: Sun, 29 May 2011 20:11:34 -0700
Message-ID: <BANLkTinKLcYmStvBEGDcN84BapJXe5Y5bg@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker>
	<20110527205721.21000.78599.stgit@riker>
	<20110528012427.GB5971@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110528012427.GB5971-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 27, 2011 at 6:24 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Fri, May 27, 2011 at 01:57:26PM -0700, John Bonesio wrote:
>
>> =A0 =A0 =A0 harmony_audio: audio_card {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,harmony-audio";
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&codec 226 0>, /* spkr_en, gpio=
 wm8903 #2 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpio 178 0>, /* hp_det, =
gpio PW2 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpio 184 0>, /* int_mic_=
en, gpio PX0 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpio 185 0>; /* ext_mic_=
en, gpio PX1 */
>> +
>
> This is a step back from the usability of the existing platform data =
-
> the platform data uses a series of individually named GPIOs while thi=
s
> uses an array of GPIO numbers with magic indexes. =A0The fact that yo=
u
> need comments explaining what the functions of the array elements are
> is a bit of a red flag here.

Agreed, I had similar concerns with the sdhci bindings where it used a
3-element array of gpios instead of the previous named ones. I was
told it's common practice to do it that way though? Seems like a step
backwards to me. :(


-Olof
