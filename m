From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: heads up: for-3.4 branch will be split up
Date: Wed, 1 Feb 2012 00:44:45 -0800
Message-ID: <CAOesGMi_+_wprZkM3jcJ=BX8V2Efi-XF0DWGDT78hnEQunbTPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When I started collecting patches for 3.4, I wasn't sure how much
activity there would be on different topics. So I just applied all
patches to the same (for-3.4) branch.

That branch is growing, and it's time to split it up. Likely in
similar categories as we used for 3.3 -- 'cleanup', 'soc', 'board' are
the obvious first choices. If there's enough standalone patches for
it, I might do a separate 'dt' branch too.

I'll likely do this tomorrow or the next day. I think most people work
on top of the for-next branch anyway, which will not change in
contents.


-Olof
