From: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 1 Jul 2016 16:40:46 +0100
Message-ID: <20160701154046.GE8609@e106497-lin.cambridge.arm.com>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
 <6212651.41bebQZ9BM@wuerfel>
 <20160701145244.GD8609@e106497-lin.cambridge.arm.com>
 <14945085.QO6LcyFgTY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <14945085.QO6LcyFgTY@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Tomasz Nowicki <tn@semihalf.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 01, 2016 at 05:17:11PM +0200, Arnd Bergmann wrote:
> On Friday, July 1, 2016 3:52:44 PM CEST Liviu Dudau wrote:
> >=20
> > >=20
> > > or do you mean we should have extra alignment in there so the
> > > private pointer has a minimum alignment higher than the
> > > alignment of struct pci_host_bridge?
> >=20
> > but this ^. bridge pointer arithmetic means +1 is not necessarily +=
sizeof(struct pci_host_bridge)
> > bytes. AFAIK that can be rounded to the nearest natural alignment f=
or pointers on that
> > architecture.
>=20
> No, that's not how it works.

Really? If struct foo takes 31 bytes, and struct foo *p =3D (struct foo=
*)64, what's p's
value after p++ ? 95? I thought the compiler is allowed to consider the=
 structure padded so that
p++ is 96.

>=20
> > > I'm absolutely fine with any of those suggestions, whichever
> > > makes the nicest API.
> >=20
> > Does anyone need to subclass the pci_host_bridge structure? And is =
appending data right
> > after the structure useful?
>=20
> I was basically following the way alloc_etherdev() and a lot of other
> subsystems handle it.

Probably valid if casted to char* ?

Liviu

>=20
> 	Arnd
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
