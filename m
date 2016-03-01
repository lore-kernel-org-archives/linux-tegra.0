From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [tegrarcm PATCH v2] Add support for production devices secured
 with PKC
Date: Tue, 1 Mar 2016 12:12:40 +0100
Message-ID: <20160301121240.596c664c@avionic-0020>
References: <1456768181-12983-1-git-send-email-alban.bedel@avionic-design.de>
	<fbd256251e014b23a189337a7d251da0@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/KdqKoKnyh1ovFEK_ClS993T"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fbd256251e014b23a189337a7d251da0-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Sig_/KdqKoKnyh1ovFEK_ClS993T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Feb 2016 23:03:01 +0000
Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Alban,
>=20
> First of all, I believe the code your added here should and will work.
> However, it is probably purely coincident that I was adding similar
> functions as requested by Avionic Design (AD) in the last a few weeks.
> I think we could merge both approaches and result in one best
> solution.=20

Up to yesterday what I did was only based on guess work, it was enough
to use RCM, but loading the bootloader failed. Now we finally got access
to (part of) the miniloader source and I was able to pin point the
missing piece to start the bootloader. The miniloader need the
bootloader signature before the bootloader binary when in PKC mode.
I added that and I was finally able to bootstrap my fused board.

> The main differences between your and mine are:
> 1. When to sign.
>     My solution is to separate signing and flashing. Ie, signing can be
> done at a secure server and flashing at non-secure factory. During
> flashing, only signed RCM messages and bootloader are needed. No pkc
> private key file is required to be present at factory. This private
> key management feature is also requested by AD. Your solution requires
> the rsa key file being present when downloading flasher.

Yes, this is currently not suited for production. But I first wanted to
have a tool that allow me to recover fused boards. We expected to be
able to use the "official" nvidia tooling (nvflash) for production.
However there are still problems with nvflash, so we might need a
"production ready" tegrarcm in the future.

>     I will send you my complete solution in another email thread. =20

That would be nice.

> 2. How to sign
>     When I was adding rsa signing supporting functions into cbootimage
> for t210, the consensus is not adding rsa signing code into
> cbootimage. Instead, we should utilize openssl.  So, we ended up a
> shell script that calls openssl, cbootimage and other utilities to
> sign a given bootimage. What was added into cbootimage are some new
> configuration options that take rsa key's modulus and signatures as
> file and embed them into bootimage. I saw you have expanded rsa
> supporting to T124. With TOT cbootimage, I can run the attached script
> to sign T124 bootimage.
>
>     So, the solution I provided has no any rsa signing functions added
> into tegrarcm. Instead, use shell script to call openssl and modified
> tegrarcm to support for rsa signing.
>=20
>      If my understanding is correct, the rsa signing functions you added
> here are only APIs. The actually signing are actually done by
> cryptlib. So, it is kind of in the middle. If everyone agrees, I am
> fine with it.

tegrarcm already make use of crypto++ for the AES-CMAC, so that seemed
logical to use that for the RSA-PSS signing too. To be honest I'm not
too keen on relying on external scripts for these kind of things.
I find the current solution for cbootimage quiet horrible TBH. It do
works, but it is too complex to use and error prone.

Now for tegrarcm the idea I had for production would be to allow
it to record and replay the USB command sequence. That way one could
generate a file containing the signed programming sequence that could
then be used in factories without needing the key.

Alban

--Sig_/KdqKoKnyh1ovFEK_ClS993T
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW1XkoAAoJEHSUmkuduC28AoUP/i7VxBcT0yPU7oB+vYAnkFLl
R7Z2ocioVERGno50r5wZZuuNC0W2eBL0+HWVKsTvhNpE9iFuzvCNk6/jqxghMM2g
Lol1A6ZRRsv7SCvHYbyG6bgVwM1XBH0ShTztHHGC//OOZW091hCgxMhqNy+a23Ve
0nHnIyFX7oMg44MqacMNr/33t3G6PCCPWxDfX0ZI90enaW+pNmAeQCtzN5rGIO2a
67C+xlKAB2STb6104E+dlQ7h4muwik83ULO5o7yxFSl7mEnWNEZeVl+JtV1bDmqL
vM0oVVKcRF9V9aKmZO/UpkyicL3+nv2pQA93CNlxVM5u+g2p5QAZY9Vyno5xicS1
c700ofmQPUZqwyoogH6PPx2hXlnVvE+jr6OvrrYI3bEde2XrIgC1x5jKQQzGOT1y
MGmcUoKQAF0UPd6nEnrXOUKIeoTFFindj8hXSptpc2578hUohASLAiajtMkT8ISW
5rm8JhRzVBgYPpUPyc5AVKD0digicB9YKfFrMROGty4pJMVM4uD9s/nsTI6Mx9/L
U25er84CiRbLWvuJEHK1TNJzUmglnr0DpathzmAH9UWwrqKnv6Cr14v6Vz6gT1s7
YeL84/8JqrKxcvtcypA8ARaOQ2GPZAKYIExXOOVq3y6OcsOvzOXj6DOOlx05S7//
yCL729hd6puLKAPSUkGP
=ujqH
-----END PGP SIGNATURE-----

--Sig_/KdqKoKnyh1ovFEK_ClS993T--
