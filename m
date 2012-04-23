From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH V2 2/4] staging: iio: light: of: Fix vendor prefix of
 isl29018/isl29028
Date: Mon, 23 Apr 2012 10:49:12 -0700
Message-ID: <20120423174912.GA3214@kroah.com>
References: <1335183097-21104-1-git-send-email-ldewangan@nvidia.com>
 <1335183097-21104-4-git-send-email-ldewangan@nvidia.com>
 <4F958E9F.8070402@wwwdotorg.org>
 <20120423172829.GA2666@kroah.com>
 <4F9594DB.5070308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F9594DB.5070308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 23, 2012 at 11:43:55AM -0600, Stephen Warren wrote:
> On 04/23/2012 11:28 AM, Greg KH wrote:
> > On Mon, Apr 23, 2012 at 11:17:19AM -0600, Stephen Warren wrote:
> >> On 04/23/2012 06:11 AM, Laxman Dewangan wrote:
> >>> ISL29018/ISL29028 is from Intersil Corporation and making the
> >>> vendor prefix for this part as "isil" for OF compatibity.
> >>>
> >>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> I assume this patch will go through the staging tree. Let me know if you
> >> want me to take it through the Tegra tree.
> > 
> > Please take it through the Tegra tree, it is probably easier overall
> > that way:
> > 	Acked-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> 
> Sorry, looking harder, this patch touches a file that's added in the
> current staging tree, so I can't take this patch.
> 
> There aren't any dependencies between this patch and the others due to
> the way I2C probing works (the OF vendor prefix ends up getting
> ignored), so I think merging it into staging should be simple.

Ok, I'll do that, Laxman, can you resend it to me?

thanks,

greg k-h
