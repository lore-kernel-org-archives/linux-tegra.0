From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 0/8] Support for Tegra 2D hardware
Date: Tue, 22 Jan 2013 11:03:20 +0200
Message-ID: <50FE55D8.6090804@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358250244-9678-1-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15.01.2013 13:43, Terje Bergstrom wrote:
> This set of patches adds support for Tegra20 and Tegra30 host1x and
> 2D. It is based on linux-next-20130114. The set was regenerated with
> git format-patch -M.

I have pushed both the kernel patches and libdrm changes to
git-OGgr7I4mDcYgsBAKwltoeQ@public.gmane.org:linux-host1x/linux-host1x.git and
git-OGgr7I4mDcYgsBAKwltoeQ@public.gmane.org:linux-host1x/libdrm-host1x.git.

They're not intended to compete with any other repository - I just
wanted to have one place where people can download the kernel patches,
libdrm changes and test suite. I'll remove them once they've served
their purpose.

I'd appreciate feedback on the patches. So far the only feedback has
been from Stephen about clock changes.

Terje
