From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: fixed few coding style warnings
Date: Thu, 15 Oct 2015 11:15:07 +0200
Message-ID: <3046503.lL92KFT0lm@fb07-iapwap2>
References: <20151014140822.GA23114@localhost.localdomain>
 <1971511.Ec7FdKlGRN@fb07-iapwap2> <20151015084812.GP7289@mwanda>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2132116303015704388=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20151015084812.GP7289@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-tegra@vger.kernel.org, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Sakshi Bansal <sakshi.april5@gmail.com>
List-Id: linux-tegra@vger.kernel.org

--===============2132116303015704388==
Content-Type: multipart/signed; boundary="nextPart4311297.pNsbEbgStr"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart4311297.pNsbEbgStr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 15. Oktober 2015, 11:48:12 schrieb Dan Carpenter:
> On Thu, Oct 15, 2015 at 10:39:02AM +0200, Marc Dietrich wrote:
> > > > -			if (unlikely(nvec->rx == NULL)) {
> > > > +			if (!unlikely(nvec->rx)) {
> > > 
> > > This isn't right.  You intented to say:
> > > 	if (unlikely(!nvec->rx)) {
> > > 
> > > But even better to just remove the unlikely entirely.
> > > 
> > > 	if (!nvec->rx) {
> > 
> > why? the "unlikely" is there to optimize a critical interrupt path.
> 
> The rule is that drivers should not use likely/unlikely() unless there
> is a difference in benchmark numbers. 

well, we know that additional cpu cycles in this path break transfer for 
unknown reasons. However, the unlikely here may be overkill. On the other 
hand, I prefer not to change something here until these timing effects are 
better understood.

> How critical can it be when it's
> always followed by a udelay(100)???

yes, this delay shouldn't be there at all. This is one of the timing mysteries 
we still have to resolve.

> There are more important optimizations needed here.

sure. We are currently trying to move all this out into the tegra-i2c driver, 
so this code block will get a major review/rewrite in the near future anyway.

Marc

--nextPart4311297.pNsbEbgStr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWH26bAAoJEKyeR39HFBtoxq4H/j0PQF1sItKZqmXYIqNLnlPQ
vgmm/dHRhOoLajIAcGjevat/bjuewz8U73LsM0BINLDJ9Mo0Z/GS6+MbbALVN7n/
++vyWTCDoTahoxBvK9C+qOct6X0molcnHKrU9FEen4DDmN9m6bLgKztFJtoLeQxH
IPSuQDVFTXU+Uj9nxSObBPlAsRiMe488JUu3v941zjtuDjYmJqtwBSH5cIcmazn0
RBcs80WZfvEt1eaSKH3sVNkR85lnMgA5fsGTOhH24CcZQGWA8B6Cj5BJNWFB8VP3
Kpwp17B5tGBTgltMhAX4Fw7lbGWlpUY9vMR47c0FZaZs4sUqeV4U0Cs4S/TBpxk=
=n9CC
-----END PGP SIGNATURE-----

--nextPart4311297.pNsbEbgStr--


--===============2132116303015704388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============2132116303015704388==--
