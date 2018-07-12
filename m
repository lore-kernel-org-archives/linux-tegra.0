From: Aapo Vienamo <avienamo@nvidia.com>
Subject: Re: [PATCH v4 2/4] clk: tegra: refactor 7.1 div calculation
Date: Thu, 12 Jul 2018 10:44:16 +0300
Message-ID: <20180712104416.7d2a6e14@dhcp-10-21-25-168>
References: <1531154338-3998-1-git-send-email-avienamo@nvidia.com>
        <1531154338-3998-3-git-send-email-avienamo@nvidia.com>
        <5805047f-4099-db34-0759-42e4a9e11629@nvidia.com>
        <20180711080022.GB1636@tbergstrom-lnx.Nvidia.com>
        <ef90eb24-e993-9cc1-ac09-5afedeceba75@nvidia.com>
        <20180711111754.GC1636@tbergstrom-lnx.Nvidia.com>
        <7022b1f4-97ac-aa1b-5c60-d7041da6704b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7022b1f4-97ac-aa1b-5c60-d7041da6704b@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 11 Jul 2018 16:14:13 +0100
Jon Hunter <jonathanh@nvidia.com> wrote:

> On 11/07/18 12:17, Peter De Schrijver wrote:
> > On Wed, Jul 11, 2018 at 09:42:20AM +0100, Jon Hunter wrote:  
> >>
> >> On 11/07/18 09:00, Peter De Schrijver wrote:  
> >>> On Tue, Jul 10, 2018 at 05:17:05PM +0100, Jon Hunter wrote:  
> >>>>
> >>>> On 09/07/18 17:38, Aapo Vienamo wrote:  
> >>>>> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> >>>>>
> >>>>> Move this to a separate file so it can be used to calculate the sdmmc
> >>>>> clock dividers.  
> >>>>
> >>>> Sorry for not commenting sooner, but what is the motivation for moving
> >>>> this to its own file? I don't see why we need to do this in order to use
> >>>> elsewhere. Furthermore, the original file is quite aptly named 'clk-divider.c'
> >>>> and now we have a div71.c which seems quite specific.  
> >>>
> >>> How else would you do it?  
> >>
> >> Keep it in the same file?
> >>  
> > 
> > That seems odd. clk-divider.c is meant to implement a clock type, not
> > utility functions we happen to need in several types.  
> 
> I see, then why not have a clk-utils.c for stuff like this. I am painting
> the bikeshed here, but div71.c seems very specific and I still don't
> understand the 7.1 bit.

While the code could work with other dividers, it was called 7.1 because
the current usecases were only on 7.1 dividers. I can submit another
version with a different filename if other changes to the series come
about or if it's seen necessary to change div-frac.c from the latest
version of the series to something else.

 -Aapo
