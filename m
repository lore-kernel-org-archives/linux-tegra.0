From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] i2c: tegra: Remove suspend-resume
Date: Thu, 31 May 2018 01:17:33 +0300
Message-ID: <cf08bb15-f547-5c23-c998-233a003eddf3@gmail.com>
References: <20180513211347.7187-1-digetx@gmail.com>
 <20180530201831.6327alcmr2stgr3a@ninjato>
 <20180530202508.raee7klc2q3qoddo@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530202508.raee7klc2q3qoddo@ninjato>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 30.05.2018 23:25, Wolfram Sang wrote:
> 
>> Applied to for-next, thanks!
> 
> I removed the stable tag, though. I am not 100% sure if there are not
> any side-effects for other users. If you still think it should go to
> stable, please mention this patch to stable@ after it was applied to
> linus tree. Maybe with a word or two about regression safety.
> 

Backporting to stable isn't really necessary, so no objections from me. Thank you.
