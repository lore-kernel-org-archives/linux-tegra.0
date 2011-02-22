From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH 0/7] Second batch of Tegra clock updates for 2.6.39
Date: Tue, 22 Feb 2011 11:38:09 -0800
Message-ID: <AANLkTimHJX4oqyiQ4rNF2YBgb3NyiixjU_wHP5Yd3Kpo@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298342392-21236-1-git-send-email-ccross@android.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: konkers@android.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mike@compulab.co.il
List-Id: linux-tegra@vger.kernel.org

I pushed everything except the last patch that disables bootloader
clocks to for-next.  I'll repost the last change with Olof's comments
addressed.

On Mon, Feb 21, 2011 at 6:39 PM, Colin Cross <ccross@android.com> wrote=
:
> This patch series contains two small patches out of the previous
> series that needed fixes, as well as some new ones to disable
> unused clocks during boot and related bug fixes.
>
> Patch 4 converts the Harmony and Trimslice boards to use the new
> init_early machine handler. =A0Any boards that go in after this
> patch will need to be updated to match, and this patch will need
> to be updated if any boards go in before this patch.
>
> Tested-bys on Harmony and Trimslice would be appreciated.
>
>
