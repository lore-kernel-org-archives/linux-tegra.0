From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [tegrarcm PATCH 2/2] Add support for communicating with secured
 production devices
Date: Wed, 11 Nov 2015 19:04:16 +0100
Message-ID: <20151111190416.53b5aea0@avionic-0020>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
	<1447089586-24826-3-git-send-email-alban.bedel@avionic-design.de>
	<564379ED.4060503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/0/cblcF=rL+P+RfqiKUy_Ht"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564379ED.4060503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Sig_/0/cblcF=rL+P+RfqiKUy_Ht
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 11 Nov 2015 10:25:01 -0700
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 11/09/2015 10:19 AM, Alban Bedel wrote:
> > Add the support code needed to sign the RCM with RSA-PSS as needed
> > to communicate with secured production devices. This mode is enabled
> > by passing the --key command line argument. If such a key is set the
> > RCM messages will be signed with it.
>=20
> IIRC, (at least some) Tegra chips support both SBK (which I believe uses=
=20
> the CMAC hash) and (RSA) PKC. "--key" is a bit of a generic term. It=20
> seems best to rename this cmdline option --pkc to make it clear which of=
=20
> the two options it represents, and to allow possible future addition of=20
> --sbk support without backwards compatibility issues or=20
> inconsistency/confusion in cmdline option naming.

You are right, I'll change this.

> > diff --git a/src/main.c b/src/main.c
>=20
> > @@ -123,6 +124,10 @@ static void usage(char *progname)
>=20
> > +	fprintf(stderr, "\t--key=3D<key.ber>\n");
> > +	fprintf(stderr, "\t\tSpecify the key file for secured devices. The ke=
y should be\n");
> > +	fprintf(stderr, "\t\tin DER format\n");
>=20
> Is that the same format cbootimage uses for its keys? I want to make=20
> sure we're not requiring users to convert keys to different formats in=20
> order to use different tools.

cbootimage only take binary blobs as input, so at the moment it doesn't
really matter. The example signing script use openssl, which use PEM
format per default. I don't know if openssl can autodetect the key
format but the script could definitely be made to also support keys in
DER format.

However I used DER because it is the only format directly supported by
Crypto++. I would prefer PEM as that's the more common format, but then
we would need to add a PEM parser.

> > diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp
>=20
> Please add a copyright header to the new files.

I'll do.

Alban

--Sig_/0/cblcF=rL+P+RfqiKUy_Ht
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWQ4MgAAoJEHSUmkuduC2864cQAITxunQ96Q0OAFcIqOETK1op
JfL8KZ4L3194Mz85MnkqPvfJzgOXwV8zcdfxYss1r2Dsi5Fi5i9ACCVMDOj5YseV
ybynlDFQIITpTN72j5jPppnOo0uR9siRqQnm+ofCbpZMv+0PtBeO7mGvy+mJoHlw
2B8jTVFrJIgZBe7dhSHA+bb7STnUewqxtfsXyyvjDHLoo/tdsWCEqUqd6ZETXHsj
UpLv+aso7tDP9gSh1WnKrWuPF786F9zpGY9ibgZjToCFd11rMVL+Rxc+Ej7Q9gtc
5zj2+CsUdeY3VbI0x2R0M+eDRWHvL02Cu2Geb2u2GFdO1iD7IhgG1x+cawOFak/i
t66YPL/xkIwZ3OMygGWnoAvN94HTEhS09KMMQ7j2w4c+ZkFCbYHWtFIaXtIjURbE
8jvch8UknWvSO7WIfMnUQiqQd6ZLMlLtUFqZZ7lc/nZCXahV8lMoCCqm7MLCl/tV
ZsshGLxVDHINDoOHPRaQXSXPwMD9z4vKFEg5X/a26JRVbHGPol7hqp9EZ0GYnCAl
jymP0SOlEwdsW4XELvuE6lOmtZJpu8sRV9JbhDhmOZtQdikJqjxVu/WdfdPKGCSV
R9jATiE+Ld27PbuqdHW8QN+LI7FBlTlHDyWb06c9M2mwUCMJixbomY5S3joHZRYy
/BTDiall/1r9ZkyugmsA
=Gw60
-----END PGP SIGNATURE-----

--Sig_/0/cblcF=rL+P+RfqiKUy_Ht--
