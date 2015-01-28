From: Paul Walmsley <paul@pwsan.com>
Subject: Documentation: DT bindings: update DT binding docs with Tegra chips
Date: Wed, 28 Jan 2015 16:49:36 -0700
Message-ID: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Update some of the DT binding documentation text files, per Mark's
comments at:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

The primary goal with this series is to avoid checkpatch.pl warnings
and align to the policy that Mark described.  This series also updates
Documentation/devicetree/bindings/submitting-patches.txt to formally
document this policy.

These patches apply on next-20150123.


- Paul
