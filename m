From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: Tegra: Seaboard: Add devicetree support
Date: Sun, 1 May 2011 08:46:04 -0600
Message-ID: <BANLkTimOJFxQGmPHMb2KPKQikL2sWZoQKQ@mail.gmail.com>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
 <1304136751-11629-2-git-send-email-swarren@nvidia.com> <20110501143825.GB19918@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110501143825.GB19918-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, May 1, 2011 at 8:38 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> Hi,
>
> On Fri, Apr 29, 2011 at 10:12:31PM -0600, Stephen Warren wrote:
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> =A0arch/arm/boot/dts/tegra-seaboard.dts | =A0 33 +++++++++++++++++++=
++++++++++++++
>> =A0arch/arm/mach-tegra/Makefile.boot =A0 =A0| =A0 =A01 +
>> =A02 files changed, 34 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/boot/dts/tegra-seaboard.dts
>>
>> diff --git a/arch/arm/boot/dts/tegra-seaboard.dts b/arch/arm/boot/dt=
s/tegra-seaboard.dts
>> new file mode 100644
>> index 0000000..d5c9ad7
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/tegra-seaboard.dts
>> @@ -0,0 +1,33 @@
>> +/dts-v1/;
>> +/include/ "tegra250.dts"
>> +
>> +/ {
>> + =A0 =A0 model =3D "NVIDIA Harmony";
>
> NVIDIA Seaboard?
>
>> + =A0 =A0 compatible =3D "nvidia,seaboard", "nvidia,tegra250";
>> +
>> + =A0 =A0 chosen {
>> + =A0 =A0 =A0 =A0 =A0 =A0 bootargs =3D "vmalloc=3D192M video=3Dtegra=
fb console=3DttyS0,115200n8 root=3D/dev/mmcblk1p3 rw rootdelay=3D2";
>
> I'm partial to rootwait instead of rootdelay, a little less fragile f=
or slow
> devices.
>
>> + =A0 =A0 memory {
>> + =A0 =A0 =A0 =A0 =A0 =A0 device_type =3D "memory";
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D < 0x00000000 0x1C000000
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x20000000 0x20000000 >;
>> + =A0 =A0 };
>
> I guess a node for the graphics memory could be warranted

I've modified this in devicetree test to specify the entire memory
range, and carve out 0x1c000000..0x1fffffff with a memreserve section.

>
>> +
>> + =A0 =A0 serial@70006300 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 status =3D "ok";
>> + =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D < 216000000 >;
>> + =A0 =A0 };
>> +
>> + =A0 =A0 sdhci@c8000400 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 status =3D "ok";
>> + =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&gpio 69 0>, /* cd, gpio PI5 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpio 57 0>, /* wp, gpio =
PH1 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <&gpio 70 0>; /* power, gp=
io PI6 */
>
> How would you represent just one missing gpio here? It might be bette=
r
> to have separate properties for each.

The gpio binding allows for empty entries by using '0' for the phandle.

>
> Also, it'd be nice to document these assumptions where other device t=
ree
> bindings are (Documentation/devicetree/bindings).
>
>
> -Olof
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
