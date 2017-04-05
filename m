From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH 1/2] post.mk: Add dependency of emmc
 image on bct file
Date: Wed, 5 Apr 2017 09:21:10 -0600
Message-ID: <54651a04-bab8-bdfd-3113-22e773303c07@wwwdotorg.org>
References: <8bf27012-af67-3faf-206b-ebd5cd76b276@wwwdotorg.org>
 <20170403122511.7194-1-nikolaus.schulz@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170403122511.7194-1-nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2017 06:25 AM, Nikolaus Schulz wrote:
> Creating an emmc image requires the bct file as a prerequisite.
> Add the dependency to post.mk.

After thinking about this, I'm going to apply "post.mk: Create 
dependency makefile by makefile rule" instead of this series. I believe 
that patch has two advantages over this series (1) where multiple BCTs 
exist, changing a BCT only rebuilds the specific images that use it (2) 
there's no need to hard-code any of the bootloader filenames in the 
makefile.
