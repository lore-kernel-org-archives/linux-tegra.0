From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [Linux-kernel] [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Mon, 19 Jan 2015 14:26:39 +0000
Message-ID: <54BD141F.7070803@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk> <54AFF7E6.9030308@gmail.com> <54B0017E.2060509@codethink.co.uk> <54B0028C.8050802@gmail.com> <54B00C58.3070303@codethink.co.uk> <54B40C99.4020907@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="JtNecI7mhEw6jvSV5bftDj1B55uAwRQVF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B40C99.4020907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JtNecI7mhEw6jvSV5bftDj1B55uAwRQVF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/15 18:04, Dmitry Osipenko wrote:
> 09.01.2015 20:14, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 09/01/15 16:32, Dmitry Osipenko wrote:
>>> 09.01.2015 19:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 09/01/15 15:46, Dmitry Osipenko wrote:
>>>>> What about suspend/cpuidle? Won't it make sense to set BE mode in
>>>>> reset handler?
>>>>
>>>> I did try adding:
>>>>
>>>>      ARM_BE8(setend    be)
>>>>
>>>> to the entry point within reset-handler.S, but to no avail. There ar=
e
>>>> definitely problems with suspend, which currently I can work around =
by
>>>> turning off ARCH_SUSPEND_POSSIBLE. More investigation is going to be=

>>>> needed to get the sleep/suspend working.
>>>>
>>>
>>> Yeah, just noticed that it mentioned in cover letter.
>>
>> I had a look through the code and it was not easy to work out what
>> was going on so skipped over it. We decided to leave it out of the
>> initial submission as we can get a workable system without suspend.
>>
>> The suspend/resume code does make accesses to registers, and all
>> these will need to be found and have the correct endian conversion
>> done (stores will be in big-endian but the hardware registers stay
>> little endian)
>>
> I fixed cpuidle and suspend for tegra2, it involved fixing reset
> handler, sleep and l2 cache resume asm code. Also fixed tegra timer and=

> i2c drivers in order to get booting. Unfortunately I don't have tegra3
> hw nor support for it in QEMU, however cpuidle should work I suppose.
> I'll post patches later.
>=20
> https://dl.dropboxusercontent.com/u/3913472/IMG_20150112_202034.jpg

Nice. Do you have a patch for those fixes?


--JtNecI7mhEw6jvSV5bftDj1B55uAwRQVF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUvRQfAAoJELpo8mEI3J+HXxkQAMoSarKzy7SILiDOl+TVwD8h
3xbPcf1oh9DO8xucpFHwH3lJqJtjTuZ6XQ1Uu4RBB8GvyFfxrarTQZUoeLKKdNxc
9I9g5uQlY5iqMzFYLhLEBe7CyQOF1um0H1xKaED20grSYjfew05nJUWb7SQpuFuW
K44iVqkTUEi2y1m15hlgf5iGukYnw8eEkPwqGEgoRbK6NfGyprU1VfxZdXFlku0Q
3R52XoYr9h7NNT3Pz83FawdfmdkGLhPI/QL6nuEStv7efNd+IcdGdBxTISeoInxj
sh9C4AvigQKvujly6dXgMMrW8Ty992P20buGZ7wjnC5DeGlPmYxbvn7rLm9JxckK
1FbESQPpBSVoyU5T/jHqwah1VqhFNCGwgc7gSiozMQLUvPmpYABLRF1jNVnHz5tR
kbXZ4PgjBHxXId+xuB6VSct/XLruGQ03rzDZ08NuCiMsCPddLAeIZlbbC+3CloUx
8KNzjsCvDYMF1g9sQ5X8DjU+JjpNCZ6q6gj+oV0in2NuIX/vxRFIgLFyN4GxBTma
H6Bio33Asfd6exlKUbQR+YPqmr6kldspBTr8pU+p6Ij/ROWz17KGCLAUeI6qoLlA
xgUmzSLA7fQQi4nImkuKmeeqrv98ysLuWoI3WuDq476RzDCPUO0GkAu4UoxYpxHL
swMK3Vn1fk1udI62L+IX
=GhHY
-----END PGP SIGNATURE-----

--JtNecI7mhEw6jvSV5bftDj1B55uAwRQVF--
