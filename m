From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH V3] staging: nvec: remove use of clk_get_sys
Date: Sat, 12 Jan 2013 13:03:25 +0100
Message-ID: <15435010.GC4ZDSCtd5@ax5200p>
References: <1357938234-16570-1-git-send-email-swarren@wwwdotorg.org> <20130112004350.GB2578@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130112004350.GB2578-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 11 January 2013 16:43:50 Greg Kroah-Hartman wrote:
> On Fri, Jan 11, 2013 at 02:03:54PM -0700, Stephen Warren wrote:
> > From: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > As clock information is added to device tree clock can be looked up
> > using clk_get. Remove use of clk_get_sys.
> > 
> > Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > [swarren: updated TODO file to remove entry that requested this change]
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Note: This patch needs to go through the Tegra tree due to dependencies
> > on the clock driver rework there.
> 
> Fine with me:
> 	Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>

and me too:

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
