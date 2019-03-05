From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 14:58:53 +0000
Message-ID: <20190305145853.qsmcaop4ths2jgrl@shell.armlinux.org.uk>
References: <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305100731.uz6tleu3fkaruwb6@shell.armlinux.org.uk>
 <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
 <20190305115730.GE26369@ulmo>
 <CA+_ZnZQ1m8QyiMJWwmVvtdqiFRDYK8PocGpG38W0NyEZ3yA8zQ@mail.gmail.com>
 <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
 <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
 <20190305142351.ktciqkj5kycdwilr@shell.armlinux.org.uk>
 <CA+_ZnZQhvf5R2f-uMPPO3AgNbXTtoxcqpCYZR_Sb13jHN5X5wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CA+_ZnZQhvf5R2f-uMPPO3AgNbXTtoxcqpCYZR_Sb13jHN5X5wA@mail.gmail.com>
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

On Tue, Mar 05, 2019 at 07:57:18PM +0500, Embedded Engineer wrote:
> On Tue, Mar 5, 2019 at 7:23 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> > +       for (offset = page->offset; offset < page->allocation;
> > +            offset = *(int *)(page->vaddr + offset))
> 
>  error: 'struct dma_page' has no member named 'allocation'. So I
> replaced 'page->allocation' with 'page->in_use'. Did you really meant
> that? If yes, following are the boot logs:

Should've been pool->allocation.  Sorry about that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
