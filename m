From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 15:31:11 +0000
Message-ID: <20190305153111.frvgnoba646uf5ar@shell.armlinux.org.uk>
References: <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
 <20190305115730.GE26369@ulmo>
 <CA+_ZnZQ1m8QyiMJWwmVvtdqiFRDYK8PocGpG38W0NyEZ3yA8zQ@mail.gmail.com>
 <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
 <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
 <20190305142351.ktciqkj5kycdwilr@shell.armlinux.org.uk>
 <CA+_ZnZQhvf5R2f-uMPPO3AgNbXTtoxcqpCYZR_Sb13jHN5X5wA@mail.gmail.com>
 <20190305145853.qsmcaop4ths2jgrl@shell.armlinux.org.uk>
 <CA+_ZnZSTkA8vj4QYJizL=YUcvtiabrVzKtDUPYO+2v-AkgRSpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CA+_ZnZSTkA8vj4QYJizL=YUcvtiabrVzKtDUPYO+2v-AkgRSpw@mail.gmail.com>
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

On Tue, Mar 05, 2019 at 08:11:22PM +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 7:58 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> > Should've been pool->allocation.  Sorry about that.
> =

> No problems, here are the new logs:
> =

> https://pastebin.com/dfey3LwB

Thanks - the patch I posted substantially increases the amount of checking
that is done... so not surprisingly we find new forms of corruption:

tegra-ehci 7d004000.usb: pool_alloc_page ehci_qh, 0xac050240 (corrupted)
00000000: a0 02 00 00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b =A0....kkkkkkkkkk=
kk
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000020: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000040: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000050: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..

and that corruption occurred _right_ after we allocated the page, memset
the entire page to 0xa7, and wrote the "next" pointers.

Again, similar scenario to the above:

tegra-ehci 7d004000.usb: pool_alloc_page ehci_qtd, 0xac0510c0 (corrupted)
00000000: 20 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0 .............=
..
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000020: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000040: e0 01 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000050: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..

which is again right after the page is allocated and initialised.

If we look at the ci_hw_qh case, which is the one originally identified:

tegra-udc 7d000000.usb: pool_alloc_page ci_hw_qh, 0xac056080 (corrupted)
00000000: c0 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000010: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000020: 80 00 00 00 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..
00000030: a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 a7 =A0..............=
..

Again, just allocated the coherent DMA page, memset() it and written
the offsets to it, and it is already corrupted.  Tegra124 does not
appear to be dma-coherent, so these allocations will be for normal,
uncached memory.  That means the cache won't be loading entire
cachelines at a time from memory for these accesses, but will be
reading them byte by byte as we print the hex values.

The window for this corruption occuring is now very small.

Right now, I don't have anything further to add beyond what I've
already suggested as causes - this is *definitely* memory corruption
either by something else writing to memory, by the CPU writes not
properly being stored in RAM or the CPU not being able to reliably
read data back from RAM.

I wonder whether any of the memory testers run with normal, uncached
memory.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
