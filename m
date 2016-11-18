From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5] mailbox: Add Tegra HSP driver
Date: Fri, 18 Nov 2016 14:27:13 +0100
Message-ID: <20161118132713.GA14358@ulmo.ba.sec>
References: <20161115154845.24803-3-thierry.reding@gmail.com>
 <20161116174133.7062-1-thierry.reding@gmail.com>
 <CABb+yY0Fg=oDSmw_jdRvP3FbTPNkc62k9-GknPWCBE_8duzkSQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY0Fg=oDSmw_jdRvP3FbTPNkc62k9-GknPWCBE_8duzkSQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joseph Lo <josephl@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 02:28:07PM +0530, Jassi Brar wrote:
> On Wed, Nov 16, 2016 at 11:11 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > This driver exposes a mailbox interface for interprocessor communication
> > using the Hardware Synchronization Primitives (HSP) module's doorbell
> > mechanism. There are multiple HSP instances and they provide additional
> > features such as shared mailboxes, shared and arbitrated semaphores.
> >
> > A driver for a remote processor can use the mailbox client provided by
> > the HSP driver and build an IPC protocol on top of this synchronization
> > mechanism.
> >
> > Based on work by Joseph Lo <josephl@nvidia.com>.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Acked-by: Jassi Brar <jaswinder.singh@linaro.org>

Thanks!

Thierry

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLwGvAAoJEN0jrNd/PrOhVyoP/AzyJKtADcATJn9Sli5uuDgL
LTzlXF0R5NDXM40WDWxk9x65BcK9KI3JeZeMHD7M0xfzBXya0NSliJ6skI7V6JIq
WejcrtKnA1IrzextZbIX/owh2JQWBy9OspIwN881SESPjeobV2E2QuMkEcLQUR9o
5pje50YtuydHD1Ggayeu4flkBF5mBJNehdjLVUlwr6q/I+AdyUTQmf672dRZdE28
yj7IKonK7bYTfHlW6q3v8h2geSts2sJ+Pi81VE/67sNad9U1oPkJ2Cyjr/gO0x5y
3XighTgKB5sEZpEZly4eLy/6Z6BbETVy7Ig7gAI0Xw5RZe04neZ9PPaYFg/IuZh6
Ed8VQ87UCeZjxYW4rrPUW5T3EsHJsr45eDRH338EOj9+PBlx7P/ASPQU1Hqc8CTo
KyJbgIW8eFuru5XfixlgT4LBeP8gq7Oco7/sBlFeMXTq37oTPwzcpdkPv1+64A0r
TN/vWDbbkJXzuBdab1dIefW73SBzSFD/u3N6VRYrhRGESYusuDLP+tv0VZnoswpF
ENVT+zhO/oh+W97Bx5j2AzPOTWTFY8dndvkVUCYvqT1gjeuV5wNiCwxpNUPYBQQ1
VOSsOhYVXqZeQevWxzGQn5isaIDLoGsD2x7B1ecCmc+PWBRG3nVUG7lUk3I3qWar
+7jw4ZEmKGZ9flfgXff4
=1sKR
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
