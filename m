From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Mon, 13 Jan 2020 16:11:55 -0800
Message-ID: <20200114001155.GJ1214176@minitux>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200111045639.210486-1-saravanak@google.com>
 <20200113140751.GA2436168@ulmo>
 <CAGETcx8YAXOdr1__gTCT2xCPq47Cg9vGj+5HJ_ZLzy4mHxU2xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx8YAXOdr1__gTCT2xCPq47Cg9vGj+5HJ_ZLzy4mHxU2xA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Saravana Kannan <saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Patrick Daly <pdaly-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon 13 Jan 14:01 PST 2020, Saravana Kannan wrote:

> I added everyone from the other thread, but somehow managed to miss
> the Bjorn who sent the emails! Fixing that now.
> 

Thanks for looping me in Saravana.

> On Mon, Jan 13, 2020 at 6:07 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Fri, Jan 10, 2020 at 08:56:39PM -0800, Saravana Kannan wrote:
[..]
> > In the case where you're trying to inherit the bootloader configuration
> > of the SMMU, how do you solve the problem of passing the page tables to
> > the kernel? You must have some way of reserving that memory in order to
> > prevent the kernel from reusing it.
> 
> Maybe "inherit" makes it sound a lot more complicated than it is?
> Bjorn will know the details of what the bootloader sets up. But
> AFAICT, it looks like a simple "bypass"/identity mapping too. I don't
> think it actually sets up page tables.
> 

In the Qualcomm case we have a number of stream mappings installed when
the bootloader jumps to the OS, each one with SMR/S2CR referring to a CB
with SMMU_CBn_SCTLR.M not set.

As such the relevant hardware is able to access (without translation)
DDR even with SMMU_CR0.USFCFG being set.

The one case where this causes issues is that upon attaching a device to
a context we'll set SMMU_CBn_SCTLR.M, so until we actually have a
translation installed we do get faults - the difference is that these
are not picked up as fatal faults by the secure firmware, so they are
simply reported in Linux.

[..]
> > > > One option that I can think of would be to create an early identity
> > > > domain for each master and inherit it when that master is attached to
> > > > the domain later on, but that seems rather complicated from an book-
> > > > keeping point of view and tricky because we need to be careful not to
> > > > map regions twice, etc.
> > > >
> > > > Any good ideas on how to solve this? It'd also be interesting to see if
> > > > there's a more generic way of doing this. I know that something like
> > > > this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
> > > > because translations are only enabled when the devices are attached to a
> > > > domain.
> > >
> > > Good foresight. As [1] shows, identity mapping doesn't solve it in a
> > > generic way.
> >
> > I think your [1] is a special case of identity mappings where the
> > mappings are already active. If you pass the information about the
> > mappings via memory-region properties, then you should be able to
> > reconstruct the identity mapping in the kernel before switching the
> > SMMU over to the new mapping for a seamless transition.
> 
> Ok, makes sense. But I don't have the full details here. So I'll let
> Bjorn comment here.
> 

It might be possible that we can install page tables and setup 1:1
mappings for the necessary resources, but it's not all devices with a
memory-region and a iommu context defined that should have this.

I will have to discuss this in more detail with the Qualcomm engineers.

PS. One detail that I did notice while distilling the downstream patches
is that unused mappings must have SMMU_S2CRx.CBNDX = 255 or I get odd
crashes when the display (CBNDX = 0) is active. I've yet to conclude
why this is.

Regards,
Bjorn
