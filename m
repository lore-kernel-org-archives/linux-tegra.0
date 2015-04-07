From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH v2 0/4]  arm: tegra: implement NVEC driver using tegrai2c.
Date: Tue, 07 Apr 2015 13:37:01 +0200
Message-ID: <1549160.njMIY2NVTi@fb07-iapwap2>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru> <20150403194635.GC2016@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2444986.Ab3eODAqzR"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150403194635.GC2016@katana>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nextPart2444986.Ab3eODAqzR
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

Hi Wolfram,

Am Freitag, 3. April 2015, 21:46:35 schrieb Wolfram Sang:
> On Mon, Mar 30, 2015 at 11:00:11PM +0300, Andrey Danin wrote:
> > NVEC driver contains code to manage tegra i2c controller in slave mode.
> > I2C slave support was implemented in linux kernel. The goal of this
> > patch serie is to implement I2C slave mode in tegra drived and rework
> > NVEC driver to use it.
> 
> Thanks. Looks pretty good already. If being I2C slave was the reason for
> this driver being in staging, we soon need to think of a proper place
> outside staging.

yes, moving the low level i2c functions out to the bus driver was our major 
concern. But there are still some minor things left before before we can move 
out of staging.

One thing where we need your help as a I2C maintainer is how to represent an 
i2c slave device using device-tree. You may remember our discussion in the 
past from here [1] where you suggested to just make a slave client by its 
compatible name. Stephen Warren from NVIDIA raised some concerns about this 
solution because it may not be appropriate in all possible future cases (which 
is what a proper device-tree representation should take care off). He instead 
suggested to mark a slave client by adding some flag to the reg property, to 
be able to handle a situation where both master client and slave client have 
the same i2c bus address forming a loopback (e.g. for testing purpose) on the 
same bus. More details here [2].

I hope with this post I can join the different discussions somehow so we are 
able to find a common sense which is acceptable for all.

Marc

[1] http://lkml.iu.edu/hypermail/linux/kernel/1409.1/03446.html
[2] https://lists.launchpad.net/ac100/msg01361.html

--nextPart2444986.Ab3eODAqzR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVI8FdAAoJEKyeR39HFBtoIq0H/RBfaY93LLhU8lwAOZdrSJRo
zwmuDZ7V1FeHM0oqm2YZeeoxsppkZ1KslSsS4kwCaZtbepPDBFPlXX6s7sat/h3h
tWBPxigmlf+tKgZqA1MUoBuU0VWLCrqfI/sntEXzYhnkcKigZcfix4g7DEIUkT/M
iIKmHCU6Ey8b/XreZ3VLcYu2a15pfndUTK+3N+uIbSTs7Dd8hSx2nVuyD6i7o/yO
VRnzK4t7kyvJGn7e4DS5B0XkvSxXEfTpIaV5FY4YsuwSJSVk++VQfl92OwMIkgMX
xN1iKZUTeKfWtZyGr6JWDIfyaHL3jVLCS7I+Gm2lVxwSxVqOaMFado41j9WFL7w=
=Cuha
-----END PGP SIGNATURE-----

--nextPart2444986.Ab3eODAqzR--
