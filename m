From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH V2] Add a --post-flash-cmd command line argument
Date: Thu, 04 Dec 2014 09:58:21 -0700
Message-ID: <548092AD.709@wwwdotorg.org>
References: <1417694039-13060-1-git-send-email-james.thomas@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417694039-13060-1-git-send-email-james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Thomas <james.thomas-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/04/2014 04:53 AM, James Thomas wrote:
> This allows a user to specify the u-boot command to run after flashing
> is complete (e.g 'ums 0 mmc 0'), defaults to 'reset' if not set

I've applied this. Thanks.
