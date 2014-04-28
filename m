From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 07/16] ARM: l2c: convert tegra to generic l2c
 initialisation
Date: Mon, 28 Apr 2014 18:41:33 +0100
Message-ID: <20140428174133.GO26756@n2100.arm.linux.org.uk>
References: <20140428165631.GM26756@n2100.arm.linux.org.uk>
 <E1Weoso-0002Pj-LE@rmk-PC.arm.linux.org.uk> <535E8FA0.6040205@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <535E8FA0.6040205@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 28, 2014 at 11:28:00AM -0600, Stephen Warren wrote:
> On 04/28/2014 10:58 AM, Russell King wrote:
> 
> > diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
> 
> >  DT_MACHINE_START(TEGRA_DT, "NVIDIA Tegra SoC (Flattened Device Tree)")
> > -	.map_io		= tegra_map_common_io,
> >  	.smp		= smp_ops(tegra_smp_ops),
> > +	.l2c_aux_val	= 0x3c400001,
> > +	.l2c_aux_mask	= 0xc20fc3fe,
> > +	.map_io		= tegra_map_common_io,
> 
> I'm not sure why .map_io was moved. Was it to sort the entries in order
> of execution? If so, I assume that .smp should be moved too?

I moved it quite simply because I keep entries in order:

        unsigned                l2c_aux_val;    /* L2 cache aux value   */
        unsigned                l2c_aux_mask;   /* L2 cache aux mask    */
        void                    (*l2c_write_sec)(unsigned long, unsigned);
        struct smp_operations   *smp;           /* SMP operations       */
        bool                    (*smp_init)(void);
        void                    (*fixup)(struct tag *, char **,
                                         struct meminfo *);
        void                    (*init_meminfo)(void);
        void                    (*reserve)(void);/* reserve mem blocks  */
        void                    (*map_io)(void);/* IO mapping function  */
        void                    (*init_early)(void);

And the order of declaration in there (for the functions after "smp")
is the order in which they are called during kernel initialisation.
Platforms randomising their declarations is... silly.  And yes, I'll
move those l2c ones before .smp.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
