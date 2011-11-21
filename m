From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: iommu: tegra: Add initial Tegra IOMMU driver
Date: Mon, 21 Nov 2011 07:31:01 +0200
Message-ID: <20111121073101.6b369421.hdoyu@nvidia.com>
References: <1321527667-12923-1-git-send-email-hdoyu@nvidia.com>
	<CAHQjnOM-N9suPrv_nSRQsxGCNrf77rFLNtRcOdsjyz_O6bGdpA@mail.gmail.com>
	<20111118104354.GA19737@8bytes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111118104354.GA19737-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
Cc: KyongHo Cho <pullip.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Joerg,

On Fri, 18 Nov 2011 11:43:54 +0100
Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org> wrote:

> On Fri, Nov 18, 2011 at 07:19:53PM +0900, KyongHo Cho wrote:
> 
> > I found that those patches are not IOMMU API implementations.
> > I wonder why they need to be located in drivers/iommu?
> 
> The current effort goes into creating a generic framework for IOMMUs.
> These patches create their own framework which is totally the wrong
> direction, they even implement their own version of an IOMMU-API.
> 
> I object against merging them until they are converted to the generic
> IOMMU-API.

Ok, I'll in v2 of this patchset.
That was a plan, mentioned in the cover letter of this patchset.
