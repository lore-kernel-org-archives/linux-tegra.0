From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 6/6] pinctrl: tegra: Add complete device tree support
Date: Mon, 02 Apr 2012 09:34:15 -0600
Message-ID: <4F79C6F7.4070701@wwwdotorg.org>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>	<1332265479-1260-6-git-send-email-swarren@wwwdotorg.org> <CACRpkdav8x-Td-fH1Ree83GhNR8r7aA1dBsTQo2eU3nwwam21Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdav8x-Td-fH1Ree83GhNR8r7aA1dBsTQo2eU3nwwam21Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/01/2012 11:29 AM, Linus Walleij wrote:
> On Tue, Mar 20, 2012 at 6:44 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> 
>> Implement pinctrl_ops dt_node_to_map() and dt_free_map(). These allow
>> complete specification of the desired pinmux configuration using device
>> tree.
>>
>> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> ---
>> v2: Rebase on of_property_for_each_string() API changes.
> 
> Stephen is this eligible for merge? Or does it need changes on top
> of the v4 core patch?

I believe if you take everything from v3, except replace the one patch
that I posted a v4 for, and you'll be set. I don't believe the v4
changes in the intermediate patch required and changes to any later
patches. Let me know if you want me to repost the series, thanks!
