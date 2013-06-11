From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V3 3/4] ARM: dts: tegra: Correct PCIe entry
Date: Tue, 11 Jun 2013 10:30:48 +0300
Message-ID: <20130611073048.GR3847@tbergstrom-lnx.Nvidia.com>
References: <1370372252-4332-1-git-send-email-jagarwal@nvidia.com>
 <1370372252-4332-3-git-send-email-jagarwal@nvidia.com>
 <20130610195511.GC25859@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130610195511.GC25859@mithrandir>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, Jay Agarwal <jagarwal@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krishna Thota <kthota@nvidia.com>, "olof@lixom.net" <olof@lixom.net>, Laxman Dewangan <ldewangan@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "mturquette@linaro.org" <mturquette@linaro.org>, Juha Tukkinen <jtukkinen@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 10, 2013 at 09:55:12PM +0200, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Jun 05, 2013 at 12:27:31AM +0530, Jay Agarwal wrote:
> [...]
> > @@ -29,7 +29,7 @@
> >  		ranges = <0x82000000 0 0x00000000 0x00000000 0 0x00001000   /* port 0 configuration space */
> >  			  0x82000000 0 0x00001000 0x00001000 0 0x00001000   /* port 1 configuration space */
> >  			  0x82000000 0 0x00004000 0x00004000 0 0x00001000   /* port 2 configuration space */
> > -			  0x81000000 0 0          0x02000000 0 0x00010000   /* downstream I/O */
> > +			  0x81000000 0 0          0x02000000 0 0x00100000   /* downstream I/O */
> >  			  0x82000000 0 0x20000000 0x20000000 0 0x10000000   /* non-prefetchable memory */
> >  			  0xc2000000 0 0x30000000 0x30000000 0 0x10000000>; /* prefetchable memory */
> 
> That increases the I/O region size from 64 KiB to 1 MiB. Why is that
> necessary? I/O operations can only address 64 KiB, so I don't think
> adding more makes any sense.

At least PCI allows 32bit I/O addresses. No idea if anyone uses them though.

Cheers,

Peter.
