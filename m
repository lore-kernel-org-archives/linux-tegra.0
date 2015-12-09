From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/2] Fix the error reporting of
 get_bct_size_from_image() and read_bct_file()
Date: Tue, 8 Dec 2015 17:16:16 -0700
Message-ID: <566772D0.4030802@wwwdotorg.org>
References: <1449585133-9384-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449585133-9384-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/08/2015 07:32 AM, Alban Bedel wrote:
> get_bct_size_from_image() and read_bct_file() should return negative
> error codes, so add the missing minus signs. Also fix the return value
> check on get_bct_size_from_image(), a negative value indicate an error
> not zero.

I've applied the series.
