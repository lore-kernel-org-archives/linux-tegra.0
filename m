From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: fixed few coding style warnings
Date: Thu, 15 Oct 2015 10:39:02 +0200
Message-ID: <1971511.Ec7FdKlGRN@fb07-iapwap2>
References: <20151014140822.GA23114@localhost.localdomain>
 <20151014181236.GX7340@mwanda>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1379276293166079739=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20151014181236.GX7340@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, gregkh@linuxfoundation.org, linux-tegra@vger.kernel.org
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Sakshi Bansal <sakshi.april5@gmail.com>
List-Id: linux-tegra@vger.kernel.org

--===============1379276293166079739==
Content-Type: multipart/signed; boundary="nextPart1500583.9d3drafbiy"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1500583.9d3drafbiy
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 14. Oktober 2015, 21:12:36 schrieb Dan Carpenter:
> On Wed, Oct 14, 2015 at 07:38:22PM +0530, Sakshi Bansal wrote:
> > Fixed allignmnet issues and block comments usage
> 
> Split it apart by type of fix.
> 
> > @@ -617,7 +618,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
> > 
> >  		} else {
> >  		
> >  			nvec->rx = nvec_msg_alloc(nvec, NVEC_MSG_RX);
> >  			/* Should not happen in a normal world */
> > 
> > -			if (unlikely(nvec->rx == NULL)) {
> > +			if (!unlikely(nvec->rx)) {
> 
> This isn't right.  You intented to say:
> 
> 	if (unlikely(!nvec->rx)) {
> 
> But even better to just remove the unlikely entirely.
> 
> 	if (!nvec->rx) {

why? the "unlikely" is there to optimize a critical interrupt path.


Marc

--nextPart1500583.9d3drafbiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWH2YmAAoJEKyeR39HFBtolPgIAIkJL+K+midjxPnhyzUrVKJD
eAbjGo566cRR1KV9sV7/ormHRxW2OPMeilIW4uJB33hF08sDGxfiCBKekPkTHB8h
KRfmY5CiZqcA2NJRYp1lIX1gBybYwyIHkhuAullMi/5ixm5GV9cSiqBybMkW2sni
M4PuDLw7BaX+DDfiVTbI4Y+q4LEy1rvtEHfvofvIc27gQfb2fV5MCeaH6lZ6KV7h
WWUy8+xl51WV1BfHIhHIEkI6paDf1yCHu+74QrckzLX42aANwdgiDD3UhD33kTS4
RecwQUN+eo2BE/fFLcpBSB/YRn93GoVGiaByLWQW2nxrFg4y99PNBkHEjlnQbD4=
=xrvC
-----END PGP SIGNATURE-----

--nextPart1500583.9d3drafbiy--


--===============1379276293166079739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============1379276293166079739==--
