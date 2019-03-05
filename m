From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 11:22:26 +0000
Message-ID: <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 05, 2019 at 03:29:26PM +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 3:07 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > Please apply this patch so we can see the (ptrval) values.  Thanks.
> =

> Please find below logs after applying patch:
> =

> https://pastebin.com/6TaBxPX5

So we have a pattern here:

tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056080 (corrupted)
00000000: c0 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000020: 80 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056140 (corrupted)
00000000: 80 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000020: 40 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0@.............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec0561c0 (corrupted)
00000000: 00 02 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000020: 40 03 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0@.............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
tegra-udc 7d000000.usb: dma_pool_alloc ci_hw_qh, ec056200 (corrupted)
00000000: 40 02 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0@.............=
..
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7=A0 ..............=
..
00000020: 40 05 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0@.............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..

and so it goes on.

The first four bytes are the offset to the next free block of memory in
this page, so can be ignored.  The remainder of the bytes should all be
0xa7, but every word at offset 32 into these is corrupted with what
looks to be a similar offset.

We dump 0x40 bytes, which, reading the code makes the pool size 0x40
bytes in size.  Tabulating the object offset, the next offset, and
the corruption at offset 32.  Corruption1 is from your latest log,
corruption2 is derived from your previous log using the next pointer
to tie up between the two:

object offset	next		corruption1	corruption2
0x0080		0x00c0		0x00000080	0x00000080
0x0140		0x0180		0x00000140	0x00000100
0x01c0		0x0200		0x00000340	0x000001c0
0x0200		0x0240		0x00000540	0x000001c0
0x0280		0x02c0		0x00000340	0x00000300
0x0340		0x0380		0x00000540	0x00000140
0x03c0		0x0400		0x00000540	0x00000300
0x0400		0x0440		0x000003c0	0x00000140
0x0480		0x04c0		0x00000540	0x000003c0
0x0540		0x0580		0x00000480	0x00000540
0x05c0		0x0600		0x000005c0	0x000005c0
0x0600		0x0640		0x00000500	0x000005c0
0x0680		0x06c0		0x00000740	0x00000680
??????		0x0780				0x00000740
0x07c0		0x0800		0x000007c0	0x00000700

The corruption looks very much like offset values, except they do not
seem to follow any rhyme or reason.  They also appear to be different
on each boot.

Given that the sequence here when a pool allocation occurs is:

1. allocate DMA coherent page
2. memset entire page with 0xa7
3. write next offsets
4. initialise 'offset' to zero (offset of first free object)
5. add page to pools list of pages
6. allocate first object, updating offset to the next free offset read
   from the first word of the object.

then when the next allocation request comes along, we allocate the
next object in the same way as step 6.  At the point of allocating the
third object, we find that there is corruption in the third object at
0x20 bytes into it - or 0xa0 bytes into the page.

Now, what does the driver that's allocating these do with them?  That
is done via init_eps() in drivers/usb/chipidea/udc.c, which doesn't do
anything with the allocated memory.  This is the only place that the
driver allocates from this DMA pool, which is done in a loop, so we
know that the objects allocated from this pool will be in relatively
quick succession.

So this does not make sense.

I really doubt that there is anything wrong with the kernel - this USB
driver is used on other SoCs (such as iMX6) and does not exhibit this
problem - it also works on the Tegra TK1 platform as well.

You are definitely seeing memory corruption here - but given what the
above looks like, I'd put forward another possible scenario - maybe
u-boot or something else is leaving a USB controller or some other DMA
agent active, which is writing over memory while the kernel is trying
to boot, resulting in memory corruption.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
