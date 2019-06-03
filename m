From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
Date: Mon, 3 Jun 2019 09:54:05 +0200
Message-ID: <20190603075405.GB27753@ulmo>
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com>
 <CACRpkda_aK++k0eVHmGszgts86usaxbQ9uU0kqAzAjapK8AOQg@mail.gmail.com>
 <CACRpkdb6OjHZGgDHXH8gfi0WwzX8170zHJKbpbnSRv+UsZvfhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb6OjHZGgDHXH8gfi0WwzX8170zHJKbpbnSRv+UsZvfhw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Lina Iyer <ilina@codeaurora.org>, Jon Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 10:35:22PM +0200, Linus Walleij wrote:
> On Sun, Jun 2, 2019 at 3:51 PM Linus Walleij <linus.walleij@linaro.org> w=
rote:
> > On Wed, May 29, 2019 at 4:53 PM Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Hierarchical IRQ domains can be used to stack different IRQ controlle=
rs
> > > on top of each other. One specific use-case where this can be useful =
is
> > > if a power management controller has top-level controls for wakeup
> > > interrupts. In such cases, the power management controller can be a
> > > parent to other interrupt controllers and program additional registers
> > > when an IRQ has its wake capability enabled or disabled.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > > Changes in v3:
> > > - use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
> > > - add missing kerneldoc for new parent_domain field
> > > - keep IRQ_DOMAIN dependency for clarity
> >
> > Actually I applied the patch, and dropped the two lines making
> > it possible to override .to_irq() for now, so I can illustrate my
> > idea on top. If I manage.
>=20
> Bah I rewrote the whole think as I want it, maybe my ideas are stupid
> but take a look at it, also very interested in input from the irqchip
> maintainers.
>=20
> Sending it out as RFC in a moment.

Okay, taking a look.

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz00h0ACgkQ3SOs138+
s6EZfw/7BJannL3kB1Nh/+VGh/5w17Bx5M9krNi9ZnAdgOmUdIkhU2jgYJeq9rHL
lL0mqmiTp3kOC/P6UaWZDuP9Ua2c4A4tWyDm1f1/mFntd+jwdf/RCkeeGwlGKeaP
Hjk+xQLfb+iJGAIDE/yFuObO5/4NbcqtfNr62odpmhy/X2AvZT09bDIRJEtkrPdw
Eg2QIsO7Y7IQ7FaIpL353upu01V7xgiFxJuTq883zLT7TEF//RxnpYe3KEqAwVA2
Vj18fFheP0kJbFfsQWeHw7Dald+4pENxQzfq2eohnl2BdwkbFWLEwlNRcozhLgLP
cT8AX1H1L//+aOSZAnvm2QvVNsvkMyGELs1rznw6+82/BS3+bZctpDXUoJ9gl1Bc
nvZjzKftd3cUkr10K5tPgXiM/72MqQWflEHhlJ68kA2sJrOuoTEpRyNgXpIBqHuX
StSVhjqQU3UHP/QgviN1Bp/QpEI+1NPjrO1debtHdiKEa/JcwqGuzl/6bcckBwoC
0bT1bb/5DE5IFYLixCQndPaX5rWnV6xX7FDttEi7+1f6QtqvH1tkexhddKWNOCOB
rCMlNgDYTpbV0wVNixKgepiJLbUw3xxX/UMOZV161MQayl9ahIKa1y1zJWTzjlPg
nc6cNCt8uaYBLH/rm0w4nQ4VN2EypDKEn7fjj3Sk8QqLYz0s3mE=
=lwgL
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
