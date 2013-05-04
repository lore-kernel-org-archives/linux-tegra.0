From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: Fwd: Tegra 30 System hangs because of commit "pinctrl: move
 subsystem mutex to pinctrl_dev struct"
Date: Sat, 4 May 2013 15:30:04 +0200
Message-ID: <20130504133004.GC24282@game.jcrosoft.org>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
 <CAK5ve-KBDyvjNRVMcXgfnhYcajdcGsuAKaepzCBt+epiXoYvSw@mail.gmail.com>
 <517ED12B.8080502@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <517ED12B.8080502@wwwdotorg.org>
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
Cc: linux-tegra@vger.kernel.org, linus.walleij@linaro.org, Bryan Wu <cooloney@gmail.com>, patrice.chotard@st.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 13:59 Mon 29 Apr     , Stephen Warren wrote:
> On 04/29/13 12:41, Bryan Wu wrote:
> >Forward to ARM and Tegra mail list.
> >
> >---------- Forwarded message ----------
> >From: Bryan Wu <cooloney@gmail.com>
> >Date: Mon, Apr 29, 2013 at 11:15 AM
> >Subject: Tegra 30 System hangs because of commit "pinctrl: move
> >subsystem mutex to pinctrl_dev struct"
> >To: patrice.chotard@st.com, Linus Walleij <linus.walleij@linaro.org>
> >Cc: Stephen Warren <swarren@wwwdotorg.org>,
> >"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
> >
> >
> >Hi Patrice and Linus,
> >
> >I'm running linux-next on my Tegra 30 system everyday. But since
> >next-20130426 release, the linux-next kernel will hang on my Tegra 30
> >boards like Cardhu and Beaver.
> >
> >After some bisect and comparing to next-20130424, I found the commit
> >"pinctrl: move subsystem mutex to pinctrl_dev struct" introduced this
> >issue. If I simply revert this patch in next-20130429, system boots up
> >as before.
> >
> >Could you please help to check this?
> 
> I would suggest simply dropping or reverting this patch; I had
> pointed out a long time ago that it was unlikely to be correct.
> 
> My guess/suspicion is a recursive lock attempt during processing
> hogs during pinctrl device registration, or perhaps during dt->map
> conversion. Bryan, are you able to confirm this?

same issue on at91sam9g45ek

revert it

Best Regards,
J.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
