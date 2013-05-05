From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: Fwd: Tegra 30 System hangs because of commit "pinctrl: move
 subsystem mutex to pinctrl_dev struct"
Date: Sun, 5 May 2013 22:22:36 +0200
Message-ID: <20130505202236.GF24282@game.jcrosoft.org>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
 <CAK5ve-KBDyvjNRVMcXgfnhYcajdcGsuAKaepzCBt+epiXoYvSw@mail.gmail.com>
 <517ED12B.8080502@wwwdotorg.org>
 <20130504133004.GC24282@game.jcrosoft.org>
 <CACRpkdbBVJtWrRO+J=pWjfLXTcVKX++x-eeJQXGeQn_WOURUNQ@mail.gmail.com>
 <20130505112819.GD24282@game.jcrosoft.org>
 <CACRpkdZdT8==cUtH4=Y3LC-eVu6ntO2ojFC4bSXNuxa4hMJ=ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZdT8==cUtH4=Y3LC-eVu6ntO2ojFC4bSXNuxa4hMJ=ZA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On 21:57 Sun 05 May     , Linus Walleij wrote:
> On Sun, May 5, 2013 at 1:28 PM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
> > On 22:52 Sat 04 May     , Linus Walleij wrote:
> >> On Sat, May 4, 2013 at 3:30 PM, Jean-Christophe PLAGNIOL-VILLARD
> 
> >> > same issue on at91sam9g45ek
> >>
> >> Is it working with mainline (Torvalds) HEAD?
> >
> > now yes
> 
> Thanks! I had some panic there for a while :-)

I was thinking to put a jenkins to test Linus HEAD all the time
And with some automatic test one some hw

to detect it more quick

Best Regards,
J.
