From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5] set: check seek success
Date: Fri, 03 Oct 2014 09:38:42 -0600
Message-ID: <542EC302.10401@wwwdotorg.org>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de> <1412237788-20611-4-git-send-email-patrick@georgi-clan.de> <542DD8A7.7040705@wwwdotorg.org> <542E4817.1000604@georgi-clan.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <542E4817.1000604-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/03/2014 12:54 AM, Patrick Georgi wrote:
> Am 03.10.2014 um 00:58 schrieb Stephen Warren:
>> fseek is supposed to return the current offset, or -1 on error. I
 >
> The man page on my system disagrees: "Upon successful completion, fgetpos(), fseek(), fsetpos() return 0, and ftell() returns the current offset.   Otherwise,  -1  is  returned and errno is set to indicate the error."

That seems to exactly match what I said.
