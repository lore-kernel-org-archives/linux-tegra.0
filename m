From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH] Add a --post-flash-cmd command line argument
Date: Mon, 01 Dec 2014 11:35:27 -0700
Message-ID: <547CB4EF.4000405@wwwdotorg.org>
References: <1416953692-28963-1-git-send-email-james.thomas@codethink.co.uk> <1416953692-28963-2-git-send-email-james.thomas@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416953692-28963-2-git-send-email-james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/25/2014 03:14 PM, James Thomas wrote:
> This allows a user to specify the u-boot command to run after flashing
> is complete (e.g 'ums 0 mmc 0'), defaults to 'reset' if not set

You need to add a Signed-off-by line here to indicate that you're 
willing to license the patch according to the license at the top of the 
tegra-uboot-flasher file. We use the s-o-b line in the same way as e.g. 
the Linux kernel, although the actual license of the file is different. See:

http://developercertificate.org/
