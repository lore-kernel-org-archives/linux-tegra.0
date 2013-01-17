From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 00/16] big.LITTLE low-level CPU and cluster power
 management
Date: Thu, 17 Jan 2013 17:55:31 +0000
Message-ID: <20130117175531.GD5737@arm.com>
References: <1357777251-13541-1-git-send-email-nicolas.pitre@linaro.org>
 <1358157392.19304.243.camel@jlo-ubuntu-64.nvidia.com>
 <alpine.LFD.2.02.1301140849020.6300@xanadu.home>
 <1358217848.8513.14.camel@jlo-ubuntu-64.nvidia.com>
 <alpine.LFD.2.02.1301151140550.6300@xanadu.home>
 <20130116160242.GB31318@arm.com>
 <alpine.LFD.2.02.1301161614390.6300@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1301161614390.6300-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 16, 2013 at 09:18:39PM +0000, Nicolas Pitre wrote:
> On Wed, 16 Jan 2013, Catalin Marinas wrote:
> 
> > On Tue, Jan 15, 2013 at 04:44:23PM +0000, Nicolas Pitre wrote:
> > > On Tue, 15 Jan 2013, Joseph Lo wrote:
> > > > So do you have a plan to make it become a generic framework in this
> > > > series or later work?
> > > 
> > > It is already generic, except for the name.  In other words, you could 
> > > start using this code already.
> > > 
> > > I'm still debating a good substitute for the bL_ prefix in this series 
> > > to give it the appearance of generic code.
> > 
> > mc_?
> 
> Bah.   :-/

Like in multi-cluster (not "Hammer time" ;). But if they are not even
cluster dependent, a simple mp_ would also do.

-- 
Catalin
