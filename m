From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Question: DTS and redundant board IDs
Date: Fri, 04 May 2012 11:38:41 -0600
Message-ID: <4FA41421.3010205@wwwdotorg.org>
References: <2933195.fDVRYZOqQe@kira> <4FA2A64F.7040101@wwwdotorg.org> <5798689.HUgVBhM8Wg@kira>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5798689.HUgVBhM8Wg@kira>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?David_Lanzend=F6rfer?= <david.lanzendoerfer-Z7Kmv9EsliU@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/04/2012 02:47 AM, David Lanzend=F6rfer wrote:
> Hi
> Thanks a lot for your answer!
>=20
>> The machine ID isn't relevant with device tree; just supply the corr=
ect
>> content in device tree and it'll work out fine.
>
> How do I tell the kernel on which device within the tree it's running=
 on?

The kernel shouldn't really care; the DT support is designed to mostly
only directly know about Tegra20 vs. Tegra30.

> Where can I get the correct string from for adding into pinmux_config=
s?

You'll have to create it yourself by translating the content of the
board pinmux file in whatever kernel the board currently uses.

I do have a very rough Python script that mostly converts the format,
but it's got a lot of warts. I can email that to you directly if you
want. You will need to manually patch up some of the results though.

> In upstream there are strings like "compulab,trimslice" or "nvidia,ha=
rmony".
> Where can I extract the correct string for adam?

You will have to create it yourself based on the vendor and board name.
I think what you want is something like:

compatible =3D "notionink,adam", "nvidia,tegra20";

> Sry, but until now, I've just used the hw id and it worked... :-/
>=20
> Is there a documentation and I'm just unable to find it?

In the kernel source, Documentation/devicetree/bindings describes the
format of all the device tree nodes. See e.g.
pinctrl/nvidia,tegra20-pinmux.txt. Also, be sure to become familiar wit=
h
how the other Tegra device trees are constructed; see
arch/arm/board/dts/tegra*.
