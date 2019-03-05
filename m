From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 12:20:05 +0100
Message-ID: <20190305112005.GC26369@ulmo>
References: <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305100731.uz6tleu3fkaruwb6@shell.armlinux.org.uk>
 <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4190940215306915157=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Embedded Engineer <embed786@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, Russell King - ARM Linux admin <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============4190940215306915157==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2019 at 03:29:26PM +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 3:07 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > Please apply this patch so we can see the (ptrval) values.  Thanks.
>=20
> Please find below logs after applying patch:
>=20
> https://pastebin.com/6TaBxPX5

Hm... so looks like what you're getting here is the error spew from the
DMA pool debug code in mm/dmax_pool.c. The way I understand it is that
that will initialize the memory for each page allocated from the pool
with the POOL_POISON_FREED (0xa7) (see pool_alloc_page()) and then upon
adding the page to the pool list, it'll store the offset to page->offset
field and check the contents of the page.

The contents of the page then don't match the expected poison. The dump
of the corrupted memory is somewhat confusing because the values that
don't match the poison are actually expected, at least partially. From
my reading of the DMA pool code, the first four bytes store the offset
of the DMA block into the physical memory page. However, given the size
of the hexdump, it looks like the pool was allocated with a block size
of 64 bytes, which matches the code in drivers/usb/chipidea/udc.c that
allocates the "ci_hw_qh" pool.

What's strange here, though, is that the offset that's stored to the
first four bytes of a block seems to actually be stored twice per block.
The first offset seems to be correct, since it's apparently used to find
the offset of the next block to allocate. If you look at the first
corrupted hexdump:

  [    1.327553] tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056080 =
(corrupted)
  [    1.335058] 00000000: c0 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.343077] 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.351095] 00000020: 80 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.359113] 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................

This is the entry for the block at offset 0x00000080 and the offset for
the next block is 0x000000c0, which is exactly 64 bytes after the
current block. However, if you then look at the second offset that's
stored at offset 0x00000020 in the block, it's 0x00000080, which does
match the offset of the current block, but I think that may just be
coincidence. The same coincidence happens for the second corrupted
block:

  [    1.367210] tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056140 =
(corrupted)
  [    1.374709] 00000000: 80 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.382727] 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.390744] 00000020: 40 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 @...............
  [    1.398760] 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................

But not for the third:

  [    1.406965] tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec0561c0 =
(corrupted)
  [    1.414466] 00000000: 00 02 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.422483] 00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................
  [    1.430502] 00000020: 40 03 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 @...............
  [    1.438519] 00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =
 ................

The fact that we see the offset stored at offset 0x20 in each block
makes me think there's perhaps some sort of aliasing happening here. But
I'm not sure how the system would even boot this far if aliasing was
really the problem. Things should be falling apart much sooner if that's
really what's going on here.

However, this sort of aliasing is not something that your typical memory
test will catch, so it could explain why they aren't reporting any
errors.

Thierry

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlx+W2EACgkQ3SOs138+
s6ENmBAAli+Ly5mpCVxcVpwoNYpLKAAdOGEnhCijyBatcfhfCqG+i/Gm+uLFhOjN
z7a7OGtf7hOcJatAayDplAXWb1+G4Rv0WpUxpCI/5UoqN+Gzx8MNtkb8ZfC2kZDB
/1/Is6sObVJJf+1ZMUl8yIOWKBon6JTWmrg3UghnvXzPoy/QgDwxYk4deXHYbGOM
1qIYVBxgblGSCZ3W0CdJIvMobTuzmA7GqqhZ/NkjY0gzBEwnPdl6xaUO6sCRjS/w
jJ9qpLoYIr0UfY3nC69ytzApndILHPycWDH45y4qJAkl/RWF9PXXw6LXb6Wh68xV
lszf6x4DOXc7p2qpdognzBZs7bXO2X24NcDnjdWDX4fVY+Vw6vfJPCHckeAsTgcx
WWFlzGegcOKfK7CrYh5vo2HbaSJp/Ax+Xj9N7n2CwbV2vdfRnRj8Si3UkmpC+iuW
mA81iB1rpesNyQ6xYh3+emjML5NKzk2R983KTagfQPGGI0mN0R8vPnL1C7wEGHfd
q9f100kdm5AByOjIFEXqiGDIZBmhynabv8GkV3881iBeCG0n+4GRFAwRJ6b9LQDe
rywfetJE+tgLJxc2XCc46qqj/ZduuDsQQN1n8OpHOCUMEVKECEKl0woOxL6t2dEg
ahB918hbOSAFzhbLfLmT+JmbVgOxeNEYuK7pJD3fdo5+hefTK6Q=
=L4bR
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--


--===============4190940215306915157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4190940215306915157==--
