From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: tegra: remove board_init_funcs array
Date: Wed, 22 Jun 2016 15:05:35 +0200
Message-ID: <40780752.S2fyoFjsUW@wuerfel>
References: <20160622124052.1263574-1-arnd@arndb.de>
 <20160622125013.GH26943@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160622125013.GH26943@ulmo.ba.sec>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday, June 22, 2016 2:50:13 PM CEST Thierry Reding wrote:
> 
> Not enough information to check signature validity.
> On Wed, Jun 22, 2016 at 02:39:41PM +0200, Arnd Bergmann wrote:
> > In a configuration that enables CONFIG_UBSAN_SANITIZE_ALL, I am getting
> > a section mismatch warning for tegra20:
> > 
> > WARNING: arch/arm/mach-tegra/built-in.o(.data+0x6e0): Section mismatch in reference from the variable board_init_funcs to the function .init.text:paz00_init()
> > 
> > The array is no longer useful here since there is only one entry,
> > so we can simply call the function directly after checking
> > of_machine_is_compatible(). This fixes the section mismatch
> > and is easier to read.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/mach-tegra/tegra.c | 24 +++---------------------
> >  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> Shouldn't these section mismatches show up with default builds? I
> haven't seen any when building Tegra configurations.
> 
> I'm going to apply this patch because I think it's useful, but it sure
> would be nice to know why I need to enable this new UBSAN stuff to get
> these warnings now.

It depends on the how aggressive the inlining works. Without UBSAN,
gcc seems to completely optimze away the loop and just the function
directly, which it can do because 'board_init_funcs' is static.

I assume that the UBSAN object overflow check has the effect of
not dropping the symbol so it can check the size.

	Arnd
