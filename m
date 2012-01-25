From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 25 Jan 2012 11:50:24 +0200
Message-ID: <20120125095024.GD29914@tbergstrom-lnx.Nvidia.com>
References: <1326342789-5781-12-git-send-email-sjg@chromium.org>
 <1326932212-30346-1-git-send-email-swarren@nvidia.com>
 <20120124095241.GO10446@tbergstrom-lnx.Nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB81EC4@HQMAIL01.nvidia.com>
 <CAMbhsRQYt7RoXTDDPxCgGG2UX5_T86saOyns_0f_Sz-p7-gMTw@mail.gmail.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB81EEB@HQMAIL01.nvidia.com>
 <CAMbhsRScz4edCr4Cxa=QbBhuYW1M3GsbKhCbFuo5Zu9PRdNfSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMbhsRScz4edCr4Cxa=QbBhuYW1M3GsbKhCbFuo5Zu9PRdNfSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 11:59:40PM +0100, Colin Cross wrote:
> On Tue, Jan 24, 2012 at 2:43 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Colin Cross wrote at Tuesday, January 24, 2012 3:33 PM:
> >> On Tue, Jan 24, 2012 at 2:08 PM, Stephen Warren <swarren-DDmLM1+adcphl2p70BpVqQ@public.gmane.org=
m> wrote:
> >> > Peter De Schrijver wrote at Tuesday, January 24, 2012 2:53 AM:
> >> >> What about the peripheral resets which are also handled by CAR?=
 Peripheral
> >> >> clock nodes also offer assert and deassert methods for the rese=
t signal
> >> >> associated with them. Those methods are used when powergating d=
omains for
> >> >> example. Should we model this in the same binding?
> >> >
> >> > In most cases, I think the resets are handled purely within cloc=
k enable
> >> > and disable, so there's no need to explicitly manage them or rep=
resent
> >> > them in the device tree. Do you agree here?
> >>
> >> clk_enable could force a deasserted reset, but clk_disable cannot
> >> imply asserting reset. =A0The clocks need to be turned off for pow=
er
> >> management without resetting the registers.
> >
> > Yes, I just spoke to someone off-list, and he said the same thing. =
He
> > went on to say that therefore even the reset removal with clk_enabl=
e
> > was questionable, and that drivers should explicitly manage reset
> > removal themselves. Does that seem a reasonable stance? It'd certai=
nly
> > take away the somewhat asymmetric nature of reset removal just magi=
cally
> > working when you first enable the clocks. We'd presumably then want=
 a
> > common reset infra-structure and binding to match that change?
>=20
> In 99% of drivers reset is irrelevant, as long as the block is out of
> reset by the time the driver starts writing to registers.  clk_enable
> is a decent place to ensure that - it always has to be done before
> writing to the registers, and it maps nicely to the reset bits on
> Tegra.  It would be nice if those driver didn't need to deassert rese=
t
> explicitly, especially if that requires a Tegra-specific API.

I think this could be solved by moving the drivers to runtime PM and ha=
ndle the
clock and reset bits in tegra platform device specific code. iirc that'=
s the
way it's handled in OMAP?

Cheers,

Peter.=20
