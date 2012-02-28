From: Stephen Warren <swarren@nvidia.com>
Subject: Re: [PATCH v6 15/20] tegra: fdt: Add function to return
 peripheral/clock ID
Date: Tue, 28 Feb 2012 10:51:25 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DC8@HQMAIL01.nvidia.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-16-git-send-email-sjg@chromium.org>
	<4F4C149E.3070505@nvidia.com>
	<CAPnjgZ24vhy7NKj_Dt_dzn0qJ8=rj4nF04WSsY8u9MorAanzVA@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB4@HQMAIL01.nvidia.com>
	<CAPnjgZ2+6k0Ww30vrc_Qb0AnKWVfq0BaCK85HXpzTD0q67smjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ2+6k0Ww30vrc_Qb0AnKWVfq0BaCK85HXpzTD0q67smjQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Tuesday, February 28, 2012 11:44 AM:
> On Tue, Feb 28, 2012 at 10:37 AM, Stephen Warren <swarren@nvidia.com> wro=
te:
> > Simon Glass wrote at Tuesday, February 28, 2012 10:46 AM:
> >> On Mon, Feb 27, 2012 at 3:41 PM, Stephen Warren <swarren@nvidia.com> w=
rote:
> >> > On 02/27/2012 01:52 PM, Simon Glass wrote:
> >> >> A common requirement is to find the clock ID for a peripheral. This=
 is the
> >> >> second cell of the 'clocks' property (the first being the phandle i=
tself).
> >> >
> >> >> +int clock_decode_periph_id(const void *blob, int node)
> >> >
> >> >> + =A0 =A0 valid =3D clock_periph_id_isvalid(id);
> >> >
> >> > clock_periph_id_isvalid() is not the correct function to use here; t=
he
> >> > code should be checking for invalid IDs in the CAR binding, not inva=
lid
> >> > IDs in the HW periph ID definition. They're different.
> >> >
> >> > Just to be explicit, the function you need here would be:
> >> >
> >> > int clkid_to_periphid(int clkid)
> >> > {
> >> > =A0 =A0if (clk_id > 95)
> >> > =A0 =A0 =A0 =A0return -1;
> >> > =A0 =A0switch (clk_id) {
> >> > =A0 =A0case 1:
> >> > =A0 =A0case 2:
> >> > =A0 =A0case 7:
> >> > =A0 =A0case 10:
> >> > =A0 =A0case 20:
> >> > =A0 =A0case 30:
> >> > =A0 =A0case 35:
> >> > =A0 =A0case 49:
> >> > =A0 =A0case 56:
> >> > =A0 =A0case 74:
> >> > =A0 =A0case 77:
> >> > =A0 =A0case 78:
> >> > =A0 =A0case 79:
> >> > =A0 =A0case 80:
> >> > =A0 =A0case 81:
> >> > =A0 =A0case 82:
> >> > =A0 =A0case 83:
> >> > =A0 =A0case 91:
> >> > =A0 =A0case 95:
> >> > =A0 =A0 =A0 =A0return -1;
> >> > =A0 =A0default:
> >> > =A0 =A0 =A0 =A0return clkid;
> >> > =A0 =A0}
> >> > }
> >>
> >> Ick.
> >>
> >> Why is 7 in there,
> >
> > 7 affects both the UART2 and VFIR clocks/blocks.
> >
> >> and did you miss 76?
> >
> > No, that's the undocumented "la" clock.
> >
> >> Also U-Boot only goes up to 88
> >> at present so should I change the first test to match?
> >
> > No, clocks 89, 90, 92, 93, and 94 are defined in the binding, which
> > matches the CLK_OUT_ENB registers in the Tegra CAR HW (albeit not the
> > CLK_RST registers, since there are some differences between the two).
> =

> For both of your comments, since they aren't used in U-Boot, wouldn't
> it be more correct to flag these as errors also? We would have to
> update at least the clock.h header to support them.

It's probably more correct to update the periph_id enum to define all
the valid values, but either way is fine.

-- =

nvpublic
