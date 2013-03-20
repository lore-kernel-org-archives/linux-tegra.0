From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: add table lookup to mux
Date: Wed, 20 Mar 2013 08:51:58 -0700
Message-ID: <20130320155158.11073.43798@quantum>
References: <1363113747-6572-1-git-send-email-pdeschrijver@nvidia.com>
 <20130319235110.8663.67548@quantum>
 <20130320094957.GG18519@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130320094957.GG18519@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2013-03-20 02:49:57)
> On Wed, Mar 20, 2013 at 12:51:10AM +0100, Mike Turquette wrote:
> > Quoting Peter De Schrijver (2013-03-12 11:42:23)
> > > diff --git a/include/linux/clk-private.h b/include/linux/clk-private.h
> > > index 9c7f580..53d39c2 100644
> > > --- a/include/linux/clk-private.h
> > > +++ b/include/linux/clk-private.h
> > > @@ -144,12 +144,13 @@ struct clk {
> > >  
> > >  #define DEFINE_CLK_MUX(_name, _parent_names, _parents, _flags, \
> > >                                 _reg, _shift, _width,           \
> > > -                               _mux_flags, _lock)              \
> > > +                               _mux_flags, _table, _lock)      \
> > >         static struct clk _name;                                \
> > >         static struct clk_mux _name##_hw = {                    \
> > >                 .hw = {                                         \
> > >                         .clk = &_name,                          \
> > >                 },                                              \
> > > +               .table = _table,                                \
> > >                 .reg = _reg,                                    \
> > >                 .shift = _shift,                                \
> > >                 .width = _width,                                \
> > 
> > This breaks OMAP horribly since OMAP already uses this macro.  There are
> > two options:
> > 
> > 1) stop using statically initialized data and no longer use
> > clk-private.h macros.  I was under the impression that the tegra clock
> > data no longer required this?
> 
> Ok. We don't do that anymore. Maybe I just modified it out of habbit...
> 

Cool.  Will you send a V2 that drops the macro changes?

Thanks,
Mike

> > 
> > 2) if you must continue to use the clk-private.h macros (temporarily!)
> > then create a new one, DEFINE_CLK_MUX_TABLE.
> 
> Hopefully not needed.
> 
> Cheers,
> 
> Peter.
