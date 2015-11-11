From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 3/3] Add support to read and write rsa related
 fields on t124
Date: Wed, 11 Nov 2015 09:41:08 -0700
Message-ID: <56436FA4.3070906@wwwdotorg.org>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
 <1446739402-14238-4-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-4-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/05/2015 09:03 AM, Alban Bedel wrote:
> This allow creating and reading signed images for secure boot on t124.

This patch looks like it's identical to the equivalent code for T210. 
Does it depend on your other two patches, or is it independent, such 
that I can apply it now?

It'd be nice if we could share code between src/tNNN/nvbctlib_tNNN.c 
somehow rather than duplicating it all, but that's not a problem this 
patch introduces, so no need to attempt that now.
