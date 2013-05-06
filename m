From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: Fwd: Tegra 30 System hangs because of commit "pinctrl: move
 subsystem mutex to pinctrl_dev struct"
Date: Mon, 6 May 2013 22:25:01 +0200
Message-ID: <20130506202501.GI24282@game.jcrosoft.org>
References: <CAK5ve-KBDyvjNRVMcXgfnhYcajdcGsuAKaepzCBt+epiXoYvSw@mail.gmail.com>
 <517ED12B.8080502@wwwdotorg.org>
 <20130504133004.GC24282@game.jcrosoft.org>
 <CACRpkdbBVJtWrRO+J=pWjfLXTcVKX++x-eeJQXGeQn_WOURUNQ@mail.gmail.com>
 <20130505112819.GD24282@game.jcrosoft.org>
 <CACRpkdZdT8==cUtH4=Y3LC-eVu6ntO2ojFC4bSXNuxa4hMJ=ZA@mail.gmail.com>
 <20130505202236.GF24282@game.jcrosoft.org>
 <CACRpkda2EG0O-pfZQ5kLFX=cwSmUSVBJkR7Xvye3ROs3tstv9w@mail.gmail.com>
 <20130506194122.GG24282@game.jcrosoft.org>
 <20130506195403.GJ18614@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130506195403.GJ18614@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Bryan Wu <cooloney@gmail.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 20:54 Mon 06 May     , Russell King - ARM Linux wrote:
> On Mon, May 06, 2013 at 09:41:22PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 21:29 Mon 06 May     , Linus Walleij wrote:
> > > On Sun, May 5, 2013 at 10:22 PM, Jean-Christophe PLAGNIOL-VILLARD
> > > <plagnioj@jcrosoft.com> wrote:
> > > 
> > > > I was thinking to put a jenkins to test Linus HEAD all the time
> > > > And with some automatic test one some hw
> > > >
> > > > to detect it more quick
> > > 
> > > Hm yeah, I think I need a broader diversity of testsystems too ... I have this
> > > nice Chromebook so I thought if I could get a mainline kernel running on
> > > it I'd have a bigger coverage as well.
> > 
> > Maybe we could all work together to setup such automatic testing tool
> > 
> > I mean all vendors
> 
> Don't bother.  We had one, Simtec's Vince Sanders gave us the build side.
> No one was interested.  No one took any notice of it.  I have one for a
> limited number of platforms - it even boots the resulting kernels on real
> hardware.  The only person who looks at it is me.  Again, just one person,
> so little value.

Could you push the build failled on the arm ML or a specific ML

I'm really intresting I hate to brake platform support specialy yours
> 
> And that same thing will appy to anything else setup by anyone else.
> 
> It's a good idea, but it only really works if people can be bothered to
> derive value from it by checking the results.
We can have enforce policy if some brake something again and agian we can do
as Greg did for one of the Linaro dev. Force the patch to be double check by a
senior Maintainter.

And I think it will help Maintainer (Specially subsystem) to detect runtime
bug when applying code they can not test

So I really hope we could change this and make it work

Maybe as you rsaid it will not work but I'm willing to try one more time
