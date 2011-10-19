From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Wed, 19 Oct 2011 13:17:36 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173D51BF75@HQMAIL01.nvidia.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E8310825-036A-4541-9D8F-6DCED9CA88AA-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Segher Boessenkool wrote at Wednesday, October 19, 2011 2:13 PM:
> > emc {
> >   compatible = "tegra20-emc";
> >   nvidia,use-ram-code;
> >   emc-tables@<ram-code> {
> >      nvidia,ram-code = < <ram-code> >;
> >      emc-table@<dummy enumerator> {
> >         compatible = "tegra20-emc-table";
> >         clock-frequency = < >;
> >         nvidia,emc-regs = < >;
> >      }
> >   }
> 
> You need to have a reg in the emc-table node, and #address-cells
> #size-cells
> in its parent node.

Even if the nodes aren't addressable entities, but just groupings for
configuration parameters?

-- 
nvpublic
