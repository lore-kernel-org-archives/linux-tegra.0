From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Wed, 19 Oct 2011 13:17:44 -0700
Message-ID: <CAOesGMjqpaf41V6PaTCsJYtUcFT-SRezOQN7e4xfAWBaU5eO4A@mail.gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
	<CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18@HQMAIL01.nvidia.com>
	<CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CCA9@HQMAIL01.nvidia.com>
	<4E9E3801.6080707@gmail.com>
	<CAOesGMj8TREZ94RFhE3Qy=eaytOuB0YKBWw6--HAERoMB9m7Qg@mail.gmail.com>
	<4E9EE07A.20301@gmail.com>
	<CAOesGMhfAxrG4pMQ86XFzmBnHwBgrD=45eTvmA0-G2gTjaSL6Q@mail.gmail.com>
	<E8310825-036A-4541-9D8F-6DCED9CA88AA@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E8310825-036A-4541-9D8F-6DCED9CA88AA-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 19, 2011 at 1:13 PM, Segher Boessenkool
<segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
>> emc {
>> =A0compatible =3D "tegra20-emc";
>> =A0nvidia,use-ram-code;
>> =A0emc-tables@<ram-code> {
>> =A0 =A0 nvidia,ram-code =3D < <ram-code> >;
>> =A0 =A0 emc-table@<dummy enumerator> {
>> =A0 =A0 =A0 =A0compatible =3D "tegra20-emc-table";
>> =A0 =A0 =A0 =A0clock-frequency =3D < >;
>> =A0 =A0 =A0 =A0nvidia,emc-regs =3D < >;
>> =A0 =A0 }
>> =A0}
>
> You need to have a reg in the emc-table node, and #address-cells #siz=
e-cells
> in its parent node.

Ah, yes, I left that out for brevity. It'll be there in the patch.

(And apologies about the comment about the suggestion from you being
off-list when it wasn't. -- I read it on my phone and for some reason
it wasn't showing me the list of cc:s).


-Olof
